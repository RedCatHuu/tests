class PostImagesController < ApplicationController
  
  def index
    @post_images = PostImage.all
  end 
  
  def show
    @post_image = PostImage.find(params[:id])
    input_path = @post_image.images[1]
    # image = MiniMagick::Image.open(input_path)
    # @trimed_image = image.trim
    # @trimed_image = input_path
    # @trimed_image = @post_image.images.trim_image
    @trimed_image = trim_image(input_path)
  end
  
  def create
    post_image = PostImage.new(post_image_params)
    post_image.user_id = 3
    if post_image.save
      redirect_to post_images_path
    else
      @post_images = PostImage.all
      flash.now[:notice] = "失敗しました。"
      render :index
    end
  end 
  
  def save
    require "mini_magick"
    
    post_image = PostImage.find(params[:id])
    base_image = post_image.base_image
    base_image = base_image.download
    base_image = MiniMagick::Image.read(base_image)
    
    input_path = post_image.images[0]
    result = base_image.composite(MiniMagick::Image.open(input_path)) do |config|
      config.compose "Over"
      config.gravity "NorthWest"
      # 座標を動かせる。x, yの順。
      # config.geometry "+90+80"
    end 
    send_data result.to_blob, type: "image/png", disposition: "attachment; filename = fine.png"
  end 
  
  def download
    # post_image"=>{"images_d"=>["0", "1"]}
    require "mini_magick"
    which_images = params[:post_image][:images_d]
    # size = which_images.size
    
    post_image = PostImage.find(params[:id])
    base_image = post_image.base_image
    base_image = base_image.download
    base_image = MiniMagick::Image.read(base_image)
    
    which_images.each do |nth_image|
      input = post_image.images[nth_image.to_i]
      base_image = base_image.composite(MiniMagick::Image.open(input)) do |config|
        config.compose "Over"
        config.gravity "NorthWest"
      end 
    end
    # これだと前から順番に取得してしまう。
    # for i in 0..size - 1 do
    #   input = post_image.images[i]
    #   base_image = base_image.composite(MiniMagick::Image.open(input)) do |config|
    #     config.compose "Over"
    #     config.gravity "NorthWest"
    #   end 
    # end 
    result = base_image
    send_data result.to_blob, type: "image/png", disposition: "attachment; filename = fine.png"
  end 
  
  def custome
    @post_image = PostImage.find(params[:id])
    @size = @post_image.size - 1
  end
  
  def thumbnail
    @post_image = PostImage.find(params[:id])
    @thumbnail = @post_image.make_thumbnail
    @size = @post_image.size - 1
  end
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:name, :base_image, images: [])
  end 
  
  def trim_image(attachment)
    # Active Storageの添付ファイルからMiniMagick::Imageオブジェクトを生成
    image = MiniMagick::Image.read(attachment.download)
    
    # 画像をトリミング
    image.trim
    
    # トリミングされた画像を一時ファイルに保存
    # "trimmed_"で始まり、拡張子は元の画像の拡張子と同じになる一時ファイルを生成する。
    tmp_file = Tempfile.new(['trimmed_', ".#{image.type.downcase}"], 'tmp')
    # MiniMagick::Imageオブジェクトで処理された(ここではトリム)画像を一時ファイルに書き込む
    image.write(tmp_file.path)
    tmp_file.rewind
  
    # 一時ファイルをActiveStorageにアタッチ。
    # MiniMagickで加工した画像をそのままviewで表示することはできないため、active_storageに保存する。
    trimmed_blob = ActiveStorage::Blob.create_and_upload!(
      io: tmp_file,
      filename: "trimmed_#{attachment.filename}",
      content_type: image.mime_type
    )
  
    # 一時ファイルをクローズ。一時ファイルは消すとリソースが解放される。
    tmp_file.close
    tmp_file.unlink
  
    return trimmed_blob
  end
  
  def self.make_thumbnail 
    images.each do |image|
      trim_image(image)
    end
  end
  
end
