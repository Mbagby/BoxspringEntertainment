class TopicsController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.order('category_id').all
    @category = Category.find_by_id(params[:id])
    @topics = Topic.all
  end

  def show
    @categories = Category.order('category_id').all
    @topic = Topic.find(params[:id])
    @seasons = Season.where(topic_id: @topic.topic_id)
    @episodes = Episode.where(topic_id: @topic.topic_id)
  end
end
