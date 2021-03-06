class User < ApplicationRecord
  before_save { self.email.downcase! }
  has_secure_password
  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :profile, presence: true,length: { maximum: 100 }
  mount_uploader :image, ImageUploader
  has_many :posts, dependent: :destroy
  belongs_to :general_user
  has_many :relationships
end
