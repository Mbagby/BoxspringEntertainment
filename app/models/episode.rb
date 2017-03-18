class Episode < ActiveRecord::Base
	belongs_to :category
	belongs_to :topic
	belongs_to :season
end
