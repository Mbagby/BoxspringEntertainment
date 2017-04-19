class Group < ApplicationRecord
	belongs_to :hr_manager, class_name: "User"
	has_many :group_employees, dependent: :destroy
end
