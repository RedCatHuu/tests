class UsersController < ApplicationController
  
  def index
    # 変数に画像を入れることもできる！
    @image = "rubyman_shibainu.png"
    @users = User.all
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
