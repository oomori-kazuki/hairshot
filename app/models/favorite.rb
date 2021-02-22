class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :general_user
end
