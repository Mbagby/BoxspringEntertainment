class QuizesController < ApplicationController
	def show
		@user = User.find_by_id(session[:user_id])
		@categories = Category.order('category_id').all
		@quiz = Quiz.find_by_id(params[:id])
		@questions= Question.where(quiz_id: @quiz.quiz_id)
	end
end
