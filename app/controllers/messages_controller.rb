class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_category

  def index
  end

  def new
  end

  def create
    @category = Category.find(params[:category_id])
    @message = @category.messages.create!(body:params[:body], user:current_user)
    redirect_to message_board_category_path(@category)
  end

  def destroy
    @category = Category.find(params[:category_id])
    @message = @category.messages.find(params[:id])
    @message.destroy
    redirect_to message_board_category_path(@category)
  end

  private
    def get_category
      @category = Category.find(params[:category_id])
    end
end
