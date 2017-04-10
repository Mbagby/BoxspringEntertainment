ActiveAdmin.register Topic do
  permit_params :category_id, :topic_id, :title, :description, :icon, :snap_shot
  menu parent: "Channels"
  index do
    selectable_column
    id_column
    column "Channel", :category_id
    column :topic_id
    column :title
    column :description
    column 'SnapShot' do |category|
      # image_tag category.snap_shot.url, width:180, height: 120 if category.snap_shot.present?
    end
    actions
  end

  filter :category_id
  filter :title

  form do |f|
    f.inputs "Admin Details" do
      f.input :category_id, :label => 'Channel', as: :select, :collection => Category.all.map{|c| [c.title, c.id]}
      f.input :topic_id
      f.input :title
      f.input :description
      f.input :snap_shot
    end
    f.actions
  end
end
