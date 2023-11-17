class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, class_name: 'RecipeFood'
  has_and_belongs_to_many :foods, join_table: 'recipe_foods'

  validates :name, :preparation_time, :cooking_time, presence: true
end
