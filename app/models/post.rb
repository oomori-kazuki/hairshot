class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 15 } 
  mount_uploader :image, ImageUploader
end
