class HrManager::QuizzesController < HrManager::BaseController
  # def show
  #   @user = User.find_by_id(session[:user_id])
  #   @categories = Category.order('category_id').all
  #   @quiz = Quiz.find_by_id(params[:id])
  #   @questions= Question.where(quiz_id: @quiz.quiz_id)
  # end

  def new 
    @quiz = current_user.quizzes.new
    @categories = Category.all
  end

  def create
    category = Category.find params[:quiz][:content_id] rescue nil 
    if category.present?
      @quiz = category.quizzes.new quiz_params
      @quiz.save
    else
      flash[:error] = "category not found."  
    end
    flash[:notice] = "Quiz created sucessfully!" if @quiz.save
    redirect_to dashboard_quizzes_path
  end

  def destroy
    quiz = Quiz.where(id: params[:id]).first
    if quiz.present? && quiz.destroy
      flash[:notice] = "Quiz deleted sucessfully!"
    else
      flash[:alert] = "Quiz could not be deleted"  
    end
    redirect_to :back
  end

  def show
    @quiz = Quiz.find_by_id(params[:id])
    #@questions = current_user.questions - @quiz.quiz_questions.map(&:question)
  end

  def add_questions
    @quiz = Quiz.find_by_id(params[:id])
    @questions = current_user.questions - @quiz.quiz_questions.map(&:question)
  end

  def assign_questions
    quiz = Quiz.where(params[:quiz_id]).first
    params[:question_ids].each do |question_id|
      quiz_question = quiz.quiz_questions.new(question_id: question_id) 
      quiz_question.save
    end
    flash[:notice] = "Question assigned sucesfully."
    respond_to do |format|
      format.js
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name,  :hr_manager_id, :content_id)
  end

end

