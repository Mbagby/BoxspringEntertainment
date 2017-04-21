class GroupEmployee < ApplicationRecord
  belongs_to :group
  belongs_to :employee, class_name: 'User'

  delegate :full_name, to: :employee, prefix: true, allow_nil: true
  delegate :email, to: :employee, prefix: true, allow_nil: true
end
