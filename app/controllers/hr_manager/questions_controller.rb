class HrManager::QuestionsController < HrManager::BaseController
  # def show
  #   @categories = Category.order('category_id').all
  #   @user = User.find_by_id(session[:user_id])
  # end

  def new
    @question = current_user.questions.new
    @categories = Category.all
  end

  def create
    category = Category.find(params[:question][:category_id]) rescue nil 
    if category.present?
      @question = category.questions.new(question_params)
      if @question.save
        flash[:notice] = "Question created sucessfully!"
      else
        flash[:error] = "Unable to create question."  
      end
    else
      flash[:error] = "category not found."  
    end
    redirect_to dashboard_questions_path
  end

  def destroy
    question = Question.find(params[:id])
    if question.destroy
      flash[:notice] = "Question deleted sucessfully!"
    else
      flash[:error] = "Question can not removed."
    end
    redirect_to :back
  end

  private

  def question_params
    params.require(:question).permit(:question_text, :hr_manager_id, :question_options_attributes=> [:id, :option_name, :value, :is_answer,:_destroy])
  end
end
