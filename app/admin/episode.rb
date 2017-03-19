#  id: integer,
#  category_id: integer,
#  topic_id: integer,
#  season_id: integer,
#  episode_id: integer,
#  series_id: integer,
#  title: string,
#  description: text,
#  icon: string,
#  rating: integer,
#  snap_shot: string,


ActiveAdmin.register Episode do
  permit_params :category_id, :topic_id, :season_id, :episode_id, :series_id, :title, :description, :icon, :rating, :snap_shot, :video_src

  index do
    selectable_column
    id_column
    column :category_id
    column :topic_id
    column :season_id
    column :episode_id
    column :series_id
    column :title
    column :description
    column :rating
    column :video_src
    column 'SnapShot' do |category|
      # image_tag category.snap_shot.url, width:180, height: 120 if category.snap_shot.present?
    end
    actions
  end

  filter :category_id
  filter :topic_id
  filter :season_id
  filter :title

  form do |f|
    f.inputs "Admin Details" do
      f.input :category_id, :label => 'Category', as: :select, :collection => Category.all.map{|c| [c.title, c.id]}
      f.input :topic_id, :label => 'Topic', as: :select, :collection => Topic.all.map{|t| [t.title, t.id]}
      f.input :season_id, :label => 'Season', as: :select, :collection => Season.all.map{|s| [s.title, s.id]}
      f.input :episode_id
      f.input :series_id
      f.input :title
      f.input :description
      f.input :rating
      f.input :video_src
      f.input :snap_shot
    end
    f.actions
  end
end
