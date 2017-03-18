class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :question_id
      t.integer :quiz_id
      t.integer :episode_id
      t.integer :series_id
      t.integer :topic_id
      t.integer :category_id
      t.string :title
      t.text :question
      t.string :icon
      t.integer :value
      t.string :snap_shot

      t.timestamps null: false
    end
  end
end
