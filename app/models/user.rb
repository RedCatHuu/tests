class User < ApplicationRecord
  # validates(:name, {presence: true})と書くのと同じ。
  validates :name, presence: true
  has_one_attached :image
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg')
    end
    self.image
  end 
  
end
