# email             :string
# first_name 		    :string
# last_name				  :string
# company_id 			  :string
# employee_id  			:string
# avatar 		        :text
# user_type         :integer



ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :password, :password_confirmation, :company_id, :employee_id, :avatar, :user_type

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :company_id
    column :employee_id
    column :user_type
    column 'Avatar' do |user|
      image_tag user.avatar.url, width:180, height: 120 if user.avatar.present?
    end
    actions
  end

  filter :category_id
  filter :title
  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :password
      f.input :password_confiratmin
      f.input :company_id
      f.input :employee_id
      f.input :user_type
      f.input :avatar
    end
    f.actions
  end
end
