class SeasonsController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.order('category_id').all
    @seasons = Season.all
  end

  def show
    @categories = Category.order('category_id').all
    @season = Season.find_by_id(params[:id])
    @episodes = Episode.where(series_id: @season.series_id)
  end
end
