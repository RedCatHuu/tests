class HomesController < ApplicationController
  def top
  end
  
  def canvas
  end 
  
  def magick
    require 'mini_magick'
    input_path = "rubyman_shibainu.png"
    image = MiniMagick::Image.open(input_path)
    image.resize "100x100"
    image.write "rubyman_shibainu.png"
    # disposition: "attachement"でダウンロードする。inlineはダウンロードせずに表示。
    send_file "rubyman_shibainu.png", type: "image/png", disposition: "inline"
    @magick = "rubyman_shibainu.png"
  end
  
end
