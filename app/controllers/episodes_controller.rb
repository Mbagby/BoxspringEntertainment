class EpisodesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_episode
	
	def show
		# @categories = Category.order('category_id').all
		@category = @episode.category
		@quizes = Quiz.all
		@user = User.find_by_id(session[:user_id])
	end

	def video_modal
    respond_to do |format|
        format.js
    end
	end

	def comment
		@comment = @episode.comments.new(user:current_user, body:params[:comment], rate: params[:rating])
		@comment.save
		redirect_to episode_path(@episode)
	end

	def remove_comment
		@comment = @episode.comments.find(params[:comment_id])
		@comment.destroy
		redirect_to episode_path(@episode)
	end
	
	private

	def find_episode
		@episode = Episode.where(id: params[:id]).first
	end

end
