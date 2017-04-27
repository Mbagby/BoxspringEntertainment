class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @employee_assignments = Assignment.employee_assignments
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

  def quiz_questions
    @quiz = Quiz.find(params[:quiz_questoins][:quiz_id]) rescue nil
    @quiz_questions = current_user.questions - @quiz.quiz_questions.map(&:question)

    question_ids = params[:quiz_questoins][:question_id].map(&:last)
    question_ids.delete("0")
    question_ids.each do |question_id|
      quiz_question = @quiz.quiz_questions.new(question_id: question_id) 
      quiz_question.save
    end
    flash[:notice] = "Question assigned sucesfully."
    redirect_to :back
  end
end
