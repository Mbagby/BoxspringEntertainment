# email             :string
# first_name 		    :string
# last_name				  :string
# company_id 			  :string
# employee_id  			:string
# avatar 		        :text
# user_type         :integer

ActiveAdmin.register Company do
  permit_params :name, :subdivision, :contact_email

  index do
    selectable_column
    id_column
    column :name
    column :subdivision
    column :contact_email
    column("Hr Managers Count"){|company| company.hr_managers.count }
    column("Employers Count"){|company| company.employers.count }
    actions
  end

  # show do
  #   render 'user_detail', { user: user }
  # end

  filter :name
  filter :subdivision
  filter :contact_email
  form do |f|
    f.inputs "Single User Details" do
      f.input :name
      f.input :subdivision
      f.input :contact_email
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :subdivision
      row :contact_email
      panel "Hr Managers" do
        table_for company.hr_managers do
          column :email
          column :name
          column 'Avatar' do |user|
            image_tag user.avatar.url, width:100, height: 100 if user.avatar.present?
          end
        end
      end

      panel "Employers" do
        table_for company.employers do
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
