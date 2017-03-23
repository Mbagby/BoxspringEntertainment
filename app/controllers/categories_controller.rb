class CategoriesController < ApplicationController
	before_action :authenticate_user!
	def index
		@categories = Category.order('category_id').all
		@user = User.find_by_id(session[:user_id])
	end
	def show
		@user = User.find_by_id(session[:user_id])
		@categories = Category.order('category_id').all
		@category = Category.find_by_id(params[:id])
		@season = Season.where(category_id: @category.id).first
		@episodes = Episode.all
	end

	def message_board
		@category = Category.find(params[:id])
		@messages = @category.messages
	end
end
