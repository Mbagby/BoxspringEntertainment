class Assignment < ApplicationRecord
  belongs_to :content, polymorphic: true
  belongs_to :assignee, polymorphic: true
end
