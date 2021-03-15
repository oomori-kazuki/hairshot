class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true, length: { maximum: 15 } 
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end
