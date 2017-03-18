class EpisodesController < ApplicationController
	def show
		@categories = Category.order('category_id').all
		@episode = Episode.find_by_id(params[:id])
		@quizes = Quiz.all
		@user = User.find_by_id(session[:user_id])
	end
end
