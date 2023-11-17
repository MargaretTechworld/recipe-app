# spec/models/recipe_food_spec.rb

require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { User.create!(email: 'test@example.com', password: 'password') }
  let(:food) { Food.create!(name: 'Apple', measurement_unit: 'kg', price: 5, quantity: 10, user: user) }
  let(:recipe) { Recipe.create!(name: 'Test Recipe', description: 'Test Description', preparation_time: 30, cooking_time: 45, user: user) }
  subject { RecipeFood.create!(food: food, recipe: recipe, quantity: 2) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a quantity' do
    invalid_recipe_food = RecipeFood.create(food: food, recipe: recipe, quantity: nil)
    expect(invalid_recipe_food).not_to be_valid
  end
  

  it 'is associated with a food' do
    expect(subject.food).to eq(food)
  end

  it 'is associated with a recipe' do
    expect(subject.recipe).to eq(recipe)
  end
end