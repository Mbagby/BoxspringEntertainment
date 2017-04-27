# === Schema Information
#
# Table name: categories
#
# id              :integer not null, primary key
# category_id     :integer
# title           :string
# description     :text
# icon            :string
# banner          :string
# snap_shot       :string
#
# created_at      :datetime
# updated_at      :datetime
class Category < ActiveRecord::Base
  has_many :topics, dependent: :destroy
  has_many :seasons, dependent: :destroy
  has_many :episodes, dependent: :destroy
  has_many :messages, as: :messageable
  has_many :asset_libraries
  has_many :category_options
  has_many :assignments, as: :content, dependent: :destroy
  has_many :quizzes, as: :content, dependent: :destroy
  has_many :questions, dependent: :destroy

  mount_uploader :snap_shot, SnapShotUploader
  mount_uploader :banner, BannerUploader

  scope :most_recent, -> (limit) { order("created_at desc").limit(limit) }
  def category_option user
    category_options.find_by(user_id:user.id)
  end

  def message_board_permission user
    return true if user.single_user?
    user = user.hr_manager unless user.hr_manager?
    cat_option = category_options.find_by(user_id:user.id)
    cat_option.present? and cat_option.message_board == true
  end

  def comment_section_permission user
    return true if user.single_user?
    user = user.hr_manager unless user.hr_manager?
    cat_option = category_options.find_by(user_id:user.id)
    cat_option.present? and cat_option.comment_section == true
  end

end
