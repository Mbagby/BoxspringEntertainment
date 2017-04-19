class GroupEmployee < ApplicationRecord
  belongs_to :group
  belongs_to :employee, class_name: 'User'
end
