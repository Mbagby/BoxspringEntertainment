ActiveAdmin.register User, as: "HR Managers" do
  menu label: "HR Managers"
  menu parent: "Users", label: "HR Managers"
  permit_params :first_name, :last_name, :email, :password, :password_confirmation, :company_id, :avatar, :user_type

  # actions :index, :show, :new, :create, :update, :edit
  config.clear_action_items!

  action_item :only => :index do
    link_to "New HR Manager", new_admin_hr_manager_path
  end

  controller do
    def scoped_collection
      super.hr_managers
    end
  end

  index :title => "HR Managers"  do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :company_id
    column :user_type
    column 'Avatar' do |user|
      image_tag user.avatar.url, width:100, height: 100 if user.avatar.present?
    end
    actions
  end

  # show do
  #   render 'user_detail', { user: user }
  # end

  filter :first_name
  filter :last_name
  filter :email
  form :title => "HR Manager" do |f|
    f.inputs "HR Manager Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :password
      f.input :password_confiratmin
      f.input :company_id, as: :select, :collection => Company.all {|comp| [comp.name, comp.id] }
      f.input :user_type
      f.input :avatar
    end
    f.actions
  end

  show do |hr_manager|
    attributes_table do
      row :id
      row :email
      row :first_name
      row :last_name
      row :company_id
      row :created_at

      row 'Avatar' do |user|
        image_tag user.avatar.url, width:100, height: 100 if user.avatar.present?
      end

      panel "Employers" do
        table_for hr_manager.employers do
          column :email
          column :name
          column 'Avatar' do |user|
            image_tag user.avatar.url, width:100, height: 100 if user.avatar.present?
          end
        end
      end

    end
    active_admin_comments
  end

end
