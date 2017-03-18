class QuestionsController < ApplicationController
	def show
		@categories = Category.order('category_id').all
		@user = User.find_by_id(session[:user_id])
	end
end
