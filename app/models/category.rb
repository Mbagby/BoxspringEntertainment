# === Schema Information
#
# Table name: categories
#
# id 							:integer not null, primary key
# category_id 		:integer
# title  					:string
# description 		:text
# icon 						:string
# banner 					:string
# snap_shot 			:string
#
# created_at 			:datetime
# updated_at 			:datetime
class Category < ActiveRecord::Base
	has_many :topics, dependent: :destroy
	has_many :seasons, dependent: :destroy
	has_many :episodes, dependent: :destroy
	has_many :messages, as: :messageable
	mount_uploader :snap_shot, SnapShotUploader
	mount_uploader :banner, BannerUploader
end
