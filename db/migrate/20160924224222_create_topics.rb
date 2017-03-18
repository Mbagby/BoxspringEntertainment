class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :category_id
      t.text :title
      t.text :description
      t.text :icon

      t.timestamps null: false
    end
  end
end
