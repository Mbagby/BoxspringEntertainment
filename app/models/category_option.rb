# === Schema Information
#
# Table name: category_options
#
# id 							  :integer not null, primary key
# category_id 		  :integer
# user_id  				  :integer
# message_board 		:boolean
# comment_section 	:boolean
#
# created_at 			:datetime
# updated_at 			:datetime
class CategoryOption < ApplicationRecord
  belongs_to :category
  belongs_to :user
end
