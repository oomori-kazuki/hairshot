class GeneralUser < ApplicationRecord
  before_save { self.email.downcase! }
  has_secure_password
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_many :follows, class_name: "User"
  has_many :relationships
  has_many :followings, through: :relationships, source: :user
  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :post
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(user_id: other_user.id)
    end
  end
  
  def unfollow(other_user)
    relationship = self.relationships.find_by(user_id: other_user.id)
    relationship.destroy if relationship
  end
  
  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def favorite(post)
    self.favorites.find_or_create_by(post_id: post.id)
  end
  
  def unfavorite(post)
    favorite = self.favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end
  
  def favoriting?(post)
    self.favorite_posts.include?(post)
  end
end
