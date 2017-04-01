class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
  enum user_type:[:employer, :hr_manager, :single_user]

  belongs_to :plan
  has_many :asset_libraries, dependent: :destroy

  belongs_to :hr_manager, class_name: "User", foreign_key: "employee_id"
  has_many :employers, class_name: "User", foreign_key: "employee_id"

  belongs_to :company
  # validates :employee_id, presence: true, :unless => :user_type == 'hr_manager'

  scope :hr_managers, -> { where(user_type:"hr_manager") }
  scope :employers, -> { where(user_type:"employer") }
  scope :single_users, -> { where(user_type:"single_user") }

  def name
    [first_name, last_name].join(' ')
  end

  def renew
    update_attribute :end_date, Date.today + 1.month
  end

  def hr_manager?
    user_type == "hr_manager"
  end
  def employer?
    user_type == "employer"
  end
  def single_user?
    user_type == "single_user"
  end

  private
    def password_required?
      new_record? ? super : false
    end
end
