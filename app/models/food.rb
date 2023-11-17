class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', optional: true
  has_many :recipe_foods, class_name: 'RecipeFood'
  has_and_belongs_to_many :recipes, join_table: 'recipe_foods'

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
