class Food < ApplicationRecord
  belongs_to :user, foreign_key: 'users_id'
  has_many :recipe_foods
end
