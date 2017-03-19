class EpisodesController < ApplicationController
	before_action :authenticate_user!
	def show
		@categories = Category.order('category_id').all
		@episode = Episode.find_by_id(params[:id])
		@quizes = Quiz.all
		@user = User.find_by_id(session[:user_id])
	end

	def video_modal
		@episode = Episode.find(params[:id])
    respond_to do |format|
        format.js
    end		
	end

end
