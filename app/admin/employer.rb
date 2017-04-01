ActiveAdmin.register User, as: "Employer" do
  permit_params :first_name, :last_name, :email, :password, :password_confirmation, :company_id, :employee_id, :avatar, :user_type

  controller do
    def scoped_collection
      super.employers
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :company_id
    column :hr_manager
    column :user_type
    column 'Avatar' do |user|
      image_tag user.avatar.url, width:100, height: 100 if user.avatar.present?
    end
    actions
  end

  # show do
  #   render 'user_detail', { user: user }
  # end

  filter :category_id
  filter :title
  form do |f|
    f.inputs "Employer Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :password
      f.input :password_confiratmin
      f.input :company_id, as: :select, :collection => Company.all {|comp| [comp.name, comp.id] }
      f.input :employee_id, as: :select, :collection => User.hr_managers {|user| [user.email, user.id] }
      f.input :user_type
      f.input :avatar
    end
    f.actions
  end
end
