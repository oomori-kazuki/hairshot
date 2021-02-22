class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :general_user
end
