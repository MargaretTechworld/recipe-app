class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', optional: true
  has_many :recipe_foods, class_name: 'RecipeFood'
  has_and_belongs_to_many :recipes, join_table: 'recipe_foods'
end
