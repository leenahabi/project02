class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]
  before_action :authenticate_user! , only: [:new , :edit , :update, :destroy, :create]
  def index
    @user = current_user
    @recipe = current_user.recipes
  end

  def show
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @userr = @recipe.user
  end
  def new
    @user = current_user
    @recipe = current_user.recipes.new
  end
  def create
    @recipe = current_user.recipes.new(recipe_params)
    @recipe.save
    redirect_to recipe_path(@recipe)
  end
  def edit
    @user = current_user
    @recipe = current_user.recipes.find(params[:id])
  end
  def update
    @recipe = current_user.recipes.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end
  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

def profile
  @user = User.find(params[:id])
  @recipe = Recipe.where(user_id:@user)
end 
  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_params
    params.require(:recipe).permit(:title,:category,:notes,:ingredients,:directions,:image)
  end
end
