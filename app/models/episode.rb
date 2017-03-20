# === Schema Information
#
# Table name: episodes
#
# id 							:integer not null, primary key
# episode_id 			:integer
# series_id				:integer
# topic_id				:integer
# category_id			:integer
# title  					:string
# description 		:text
# icon 						:string
# season_id				:integer
# rating					:integer
# banner 					:string
# snap_shot 			:string
#
# created_at 			:datetime
# updated_at 			:datetime

class Episode < ActiveRecord::Base
	mount_uploader :snap_shot, SnapShotUploader
	belongs_to :category
	belongs_to :topic
	belongs_to :season
	has_many :comments, as: :commentable
	default_scope { order(episode_id: :asc) }
end
