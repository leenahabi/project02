class AnswersController < ApplicationController
    # before_action do
    #     @question = Question.find(params[:question_id])   end 
    before_action :authenticate_user! , only: [:new ,:destroy, :create]
        def index
            @user = current_user
            @recipe = Recipe.where(user_id: @user)
            @question = Question.where(recipe_id: @recipe)
        end
        # def show
        #         @user = current_user
        #         @recipe = Recipe.where(user_id: @user)
        #         @question = Question.where(recipe_id: @recipe and answered:"false")
        #         # @answer = Answer.where(question_id: @ques)
        # end  
        def new
            @question = @recipe.question
            @answer = Answer.new
          end
          def create
            @question = Question.find(params[:question_id])
            @answer = @question.answer.create(q_params)
            @answer.user = current_user
            @answer.save
        redirect_to recipe_path(@recipe)
          end
      
          def destroy
            @question = Question.find(params[:question_id])
            @answer = @question.answers.find(params[:id])
            @answer.destroy
           end
          private
        #   def set_question
        #     @question = Question.find(params[:id])
        #   end
        
          # Never trust parameters from the scary internet, only allow the white list through.
          def a_params
            params.require(:answer).permit(:answer)
          end  
end