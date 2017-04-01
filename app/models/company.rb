# === Schema Information
#
# Table name: categories
#
# id 							 :integer not null, primary key
# name 		         :integer
# subdivision  		 :string
# contact_email 	 :text
#
# created_at 			:datetime
# updated_at 			:datetime
class Company < ApplicationRecord
  has_many :hr_managers,-> { where user_type: 'hr_manager' }, class_name: "User", foreign_key: "company_id"
  has_many :employers, -> { where user_type: 'employer' }, class_name: "User", foreign_key: "company_id"
end
