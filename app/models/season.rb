# === Schema Information
#
# Table name: seasons
#
# id 							:integer not null, primary key
# category_id 		:integer
# topic_id				:integer
# series_id 			:integer
# title  					:string
# description 		:text
# rating 					:integer
# icon 						:string
# snap_shot 			:string
#
# created_at 			:datetime
# updated_at 			:datetime

class Season < ActiveRecord::Base
	mount_uploader :snap_shot, SnapShotUploader
	belongs_to :category
	belongs_to :topic
	has_many :episodes, dependent: :destroy
end
