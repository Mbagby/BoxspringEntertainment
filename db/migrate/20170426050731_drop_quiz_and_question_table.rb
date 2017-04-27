class DropQuizAndQuestionTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :questions
    drop_table :quizzes
  end
end
