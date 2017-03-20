class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  def commnted_time_string
    str_diff = ""
    diff_time = Time.now - self.created_at
    if diff_time / 1.day > 1
      str_diff = "#{(diff_time / 1.day).round} days ago"
    elsif diff_time / 1.hour > 1
      str_diff = "#{(diff_time / 1.hour).round} hours ago"
    elsif diff_time / 1.minute > 1
      str_diff = "#{(diff_time / 1.minute).round} minutes ago"
    else
      str_diff = "#{(diff_time / 1.second).round} seconds ago"
    end
    str_diff
  end
end
