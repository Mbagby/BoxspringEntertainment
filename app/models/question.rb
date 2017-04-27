class Question < ApplicationRecord
  has_many :question_options, dependent: :destroy
  belongs_to :category
  belongs_to :hr_manager, class_name: "User"
  has_many :quizzes, :through => :quiz_questions
  has_many :quiz_questions, dependent: :destroy
  accepts_nested_attributes_for :question_options


end
