class QuestionsController < ApplicationController
    before_action :authenticate_user! , only: [:new , :edit , :update, :destroy, :create]
      def new
        @question = Question.new
      end
      def create
        @recipe = Recipe.find(params[:recipe_id])
        @question = @recipe.questions.create(q_params)
        @question.user = current_user
        @question.save
        redirect_to recipe_path(@recipe)
      end
  
      def destroy
        @recipe = Recipe.find(params[:recipe_id])
        @question = @recipe.questions.find(params[:id])
        @question.destroy
        redirect_to recipe_path(@recipe)
       end
      private
    #   def set_question
    #     @question = Question.find(params[:id])
    #   end
    
      # Never trust parameters from the scary internet, only allow the white list through.
      def q_params
        params.require(:question).permit(:question)
      end
end
