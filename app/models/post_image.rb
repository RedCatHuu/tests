class PostImage < ApplicationRecord
  belongs_to :user
  has_one_attached :base_image
  has_many_attached :images
  has_many_attached :thumbnails
  
  validates :name, :base_image, :images, presence: true
  
  def size
    self.images.count
  end 
  
  
  def make_thumbnail 
    
  end
  

end
