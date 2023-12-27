class User < ApplicationRecord
  # validates(:name, {presence: true})と書くのと同じ。
  validates :name, presence: true
  has_one_attached :image
end
