class Topic < ActiveRecord::Base
	belongs_to :category
	has_many :seasons, dependent: :destroy
	has_many :episodes, dependent: :destroy
end
