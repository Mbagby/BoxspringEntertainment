ActiveAdmin.register Category do
  permit_params :category_id, :title, :description, :banner, :snap_shot

  index do
    selectable_column
    id_column
    column "Caregory ID", :category_id
    column :title
    column :description
    column 'Banner' do |category|
      image_tag category.banner.url, width:180, height: 120 if category.banner.present?
    end
    column 'SnapShot' do |category|
      image_tag category.snap_shot.url, width:180, height: 120 if category.snap_shot.present?
    end
    actions
  end

  filter :category_id
  filter :title

  form do |f|
    f.inputs "Admin Details" do
      f.input :category_id, label: "Category ID"
      f.input :title
      f.input :description
      f.input :banner
      f.input :snap_shot
    end
    f.actions
  end
end
