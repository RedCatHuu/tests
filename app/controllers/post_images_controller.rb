class PostImagesController < ApplicationController
  
  def index
    @post_images = PostImage.all
  end 
  
  def show
    @post_image = PostImage.find(params[:id])
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
  
  def back
    
  end 
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:name, :base_image, images: [])
  end 
  
end
