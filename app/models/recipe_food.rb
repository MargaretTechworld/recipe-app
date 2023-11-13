class RecipeFood < ApplicationRecord
  belongs_to :recipe_food
  belongs_to :foods
end
