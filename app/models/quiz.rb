class Quiz < ApplicationRecord
  belongs_to :hr_manager, class_name: "User"
  belongs_to :content, polymorphic: true
  has_many :questions, :through => :quiz_questions
  has_many :quiz_questions, dependent: :destroy
end
