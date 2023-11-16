class RecipeFoodsController < ApplicationController
  def show
    recipe_food = RecipeFood.find(params[:id])
    redirect_to recipe_path(recipe_food.recipe)
  end

  def new
    @user = current_user
    @foods = @user.foods
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
    @ingredients = [
      'Salt',
      'Pepper',
      'Olive Oil',
      'Garlic',
      'Onion',
      'Tomato',
      'Chicken',
      'Beef',
      'Pork',
      'Fish',
      'Lamb',
      'Butter',
      'Flour',
      'Sugar',
      'Eggs',
      'Milk',
      'Cheese',
      'Rice',
      'Pasta',
      'Bread',
      'Potatoes',
      'Carrots',
      'Bell Pepper',
      'Broccoli',
      'Spinach',
      'Mushrooms',
      'Cucumber',
      'Avocado',
      'Lemon',
      'Lime',
      'Cilantro',
      'Basil',
      'Thyme',
      'Rosemary',
      'Ginger',
      'Cinnamon',
      'Nutmeg',
      'Vanilla Extract',
      'Soy Sauce',
      'Honey'
    ]

    @foods.each do |food|
      @ingredients << ("#{food.name} in #{food.measurement_unit}")
    end
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    quantity = params[:recipe_food][:quantity]
    # food_unit = params[:recipe_food][:food]
    # food_unit.split.first
    food = Food.find(params[:recipe_food][:food])

    recipe_food = RecipeFood.new(food:, recipe:, quantity:)
    puts food.id
    if recipe_food.save
      flash[:success] = 'Object successfully created'
      redirect_to recipe_path(recipe)
    else
      flash[:error] = 'Failed to create the recipe food'
      render 'new'
    end
  end

  def modify
    recipe_food = RecipeFood.find(params[:id])
    new_quantity = params[:recipe_food][:quantity]

    if recipe_food.update(quantity: new_quantity)
      flash[:success] = 'Quantity updated successfully'
    else
      flash[:error] = 'Failed to update quantity'
    end

    redirect_to recipe_food_path(recipe_food)
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.destroy
      flash[:notice] = 'Food was successfully deleted.'
    else
      flash[:alert] = 'Failed to delete food.'
    end
    redirect_to recipes_path, notice: 'Food was successfully deleted.'
  end
end
