class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
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
