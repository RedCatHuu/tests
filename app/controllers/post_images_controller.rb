class PostImagesController < ApplicationController
  
  def index
    @post_images = PostImage.all
  end 
  
  def create
    post_image = PostImage.new(post_image_params)
    post_image.user_id = 3
    if post_image.save
      redirect_to post_images_path
    else
      @post_images = PostImage.all
      flash.now[:notice] = "失敗"
      render :index
    end
  end 
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:name, :base_image, images: [])
  end 
  
end
