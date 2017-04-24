class Assignment < ApplicationRecord
  belongs_to :content, polymorphic: true
  belongs_to :assignee, polymorphic: true
  scope :group_assignments, -> { where(assignee_type:"Group") }
  scope :employee_assignments, -> { where(assignee_type:"User") }
end
