class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_type, except: [:send_message]

  def index
  end

  def forum
  end

  def videos
  end

  def permission
  end

  def update_permission
    @category = Category.find(params[:category_id])
    @category_option = CategoryOption.find_or_create_by(category_id: @category.id)
    @category_option.update_attributes(user_id:current_user.id,message_board:params[:message_board],comment_section:params[:comment_section])
    render json: {status: "success"}
  end

  def quizzes
    @quizzes = current_user.quizzes
  end

  def questions
    @questions = current_user.questions
  end


  def send_message 
    @service = WatsonLayer::ApiCall.new
    @message = @service.send_message(params[:message])
    respond_to do |format|
      format.js
    end  
  end  

  private
  def check_user_type
    unless current_user.user_type == "hr_manager"
      flash[:notice] = "HR_Managers only can access dashboard page"
      redirect_to root_path
    else
      true
    end
  end
end
