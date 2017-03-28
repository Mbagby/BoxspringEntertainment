class EpisodesController < ApplicationController
	before_action :authenticate_user!
	def show
		# @categories = Category.order('category_id').all
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

	def comment
		@episode = Episode.find(params[:id])
		@comment = @episode.comments.new(user:current_user, body:params[:comment], rate: params[:rating])
		@comment.save
		redirect_to episode_path(@episode)
	end

	def remove_comment
		@episode = Episode.find(params[:id])
		@comment = @episode.comments.find(params[:comment_id])
		@comment.destroy
		redirect_to episode_path(@episode)
	end

end
