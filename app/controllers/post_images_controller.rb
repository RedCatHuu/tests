class PostImagesController < ApplicationController
  
  def index
    
  end 
  
  def create
    post_image = PostImage.new(post_image_params)
    post_image.user_id = 3
    post_image.save
    redirect_to post_images_path
  end 
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:name, :images)
  end 
  
end
