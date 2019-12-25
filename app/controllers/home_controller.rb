class HomeController < ApplicationController

  def index
    @user = current_user
    @recipe = Recipe.all
  end
  def show
  @recipe = Recipe.find(params[:id])
  @question = Question.where(recipe_id: @recipe)
  end
end
