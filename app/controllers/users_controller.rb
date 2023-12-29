class UsersController < ApplicationController
  
  def index
    # 変数に画像を入れることもできる！
    @image = "rubyman_shibainu.png"
    @users = User.all
    
    file_path = Rails.root.join('app/assets/images/rubyman_shibainu.png')
    image_magick = MiniMagick::Image.open(file_path)
    image_magick.resize("100x100")
    @image_magick = image_magick
    
    @user_image = User.find(3).image
  end 
  
  def show 
      
  end 
  
  def create
    User.create(user_params)
    redirect_to users_path
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :image)
  end
    
end
