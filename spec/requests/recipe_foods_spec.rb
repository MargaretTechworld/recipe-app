require 'rails_helper'

RSpec.describe RecipeFoodsController, type: :controller do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user: user) }
  let(:food) { create(:food, user: user) }
  let(:valid_attributes) { { food_id: food.id, recipe_id: recipe.id, quantity: 2 } }
  let(:invalid_attributes) { { food_id: nil, recipe_id: recipe.id, quantity: 2 } }

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new RecipeFood' do
        expect {
          post :create, params: { recipe_food: valid_attributes, recipe_id: recipe.id }
        }.to change(RecipeFood, :count).by(1)
      end

      it 'redirects to the associated recipe' do
        post :create, params: { recipe_food: valid_attributes, recipe_id: recipe.id }
        expect(response).to redirect_to(recipe_path(recipe))
      end
    end

    context 'with invalid params' do
      it 'does not create a new RecipeFood' do
        expect {
          post :create, params: { recipe_food: invalid_attributes, recipe_id: recipe.id }
        }.to change(RecipeFood, :count).by(0)
      end

      it "re-renders the 'new' template" do
        post :create, params: { recipe_food: invalid_attributes, recipe_id: recipe.id }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PATCH #modify' do
    it 'updates the requested recipe_food' do
      recipe_food = RecipeFood.create! valid_attributes
      patch :modify, params: { id: recipe_food.to_param, recipe_food: { quantity: 3 } }
      recipe_food.reload
      expect(recipe_food.quantity).to eq(3)
    end

    it 'redirects to the recipe_food' do
      recipe_food = RecipeFood.create! valid_attributes
      patch :modify, params: { id: recipe_food.to_param, recipe_food: { quantity: 3 } }
      expect(response).to redirect_to(recipe_food_path(recipe_food))
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested recipe_food' do
      recipe_food = RecipeFood.create! valid_attributes
      expect {
        delete :destroy, params: { id: recipe_food.to_param }
      }.to change(RecipeFood, :count).by(-1)
    end

    it 'redirects to the recipes list' do
      recipe_food = RecipeFood.create! valid_attributes
      delete :destroy, params: { id: recipe_food.to_param }
      expect(response).to redirect_to(recipes_path)
    end
  end
end