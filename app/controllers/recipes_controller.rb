class RecipesController < ApplicationController
    def index
        @recipes = Recipe.includes(:user).where(users_id: current_user.id)
      end
    
      def new
        @recipe = Recipe.new
      end
    
      def show
        @user = current_user
        @recipe = Recipe.includes(:recipe_foods).find(params[:id])
        @recipe_foods = RecipeFood.where(recipe_id: @recipe.id)
      end
    
      def create
        @user = current_user
        @recipe = @user.recipes.new(recipe_params)
    
        if @recipe.save
          redirect_to recipe_path(@recipe), notice: 'The recipe was succesfuly created'
        else
          render :new, alert: 'The recipe was not created'
        end
      end
    
      def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to recipe_path, notice: 'The recipe was deleted'
      end
      def recipe_params
        params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
      end
end