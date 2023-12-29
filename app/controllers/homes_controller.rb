class HomesController < ApplicationController
  def top
  end
  
  def canvas
  end 
  
  def magick
    require 'mini_magick'
    # input_path = "rubyman_shibainu.png"
    # image = MiniMagick::Image.open(input_path)
    # image.resize "200x200"
    # image.write "rubyman_shibainu.png"
    # # disposition: "attachement"でダウンロードする。inlineはダウンロードせずに表示。
    # send_file "rubyman_shibainu.png", type: "image/png", disposition: "inline"
    # @magick = "rubyman_shibainu.png"
    
    ユーザー画像をminimagickで加工処理。
    user_image = User.find(3).image
    image_blob = user_image.download
    image = MiniMagick::Image.read(image_blob)
    image.resize "100x100"
    send_data image.to_blob, type: "image/png", disposition: "inline"
    
  end
  
end
