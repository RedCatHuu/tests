class PostImage < ApplicationRecord
  belongs_to :user
  has_one_attached :base_image
  has_many_attached :images
  
  validates :name, presence: true
end
