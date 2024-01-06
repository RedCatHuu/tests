class PostImage < ApplicationRecord
  belongs_to :user
  has_one_attached :base_image
  has_many_attached :images
  
  validates :name, :base_image, :images, presence: true
  
  def size
    self.images.count
  end 
  
  def trimming(integer)
    input_path = self.images[integer]
    image = MiniMagick::Image.open(input_path)
    image.trim
    image.write(a)
  end

end
