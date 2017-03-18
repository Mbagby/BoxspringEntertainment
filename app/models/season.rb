class Season < ActiveRecord::Base
	belongs_to :category
	belongs_to :topic
	has_many :episodes, dependent: :destroy
end
