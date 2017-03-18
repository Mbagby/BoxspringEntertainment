class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :episode_id
      t.integer :series_id
      t.integer :topic_id
      t.integer :category_id
      t.string :title
      t.text :description
      t.string :icon
      t.integer :rating

      t.timestamps null: false
    end
  end
end
