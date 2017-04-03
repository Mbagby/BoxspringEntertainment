ActiveAdmin.register Season do
  permit_params :category_id, :topic_id, :series_id, :title, :description, :rating, :icon, :snap_shot
  menu parent: "Categories"
  index do
    selectable_column
    id_column
    column :category_id
    column :topic_id
    column :series_id
    column :title
    column :description
    column :rating
    column 'SnapShot' do |category|
      # image_tag category.snap_shot.url, width:180, height: 120 if category.snap_shot.present?
    end
    actions
  end

  filter :category_id
  filter :title
  form do |f|
    f.inputs "Admin Details" do
      f.input :category_id, :label => 'Category', as: :select, :collection => Category.all.map{|c| [c.title, c.id]}
      f.input :topic_id, :label => 'Topic', as: :select, :collection => Topic.all.map{|t| [t.title, t.id]}
      f.input :series_id
      f.input :title
      f.input :description
      f.input :rating
      f.input :snap_shot
    end
    f.actions
  end
end
