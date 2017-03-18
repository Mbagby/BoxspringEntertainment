class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :question_id
      t.integer :quiz_id
      t.integer :episode_id
      t.integer :series_id
      t.integer :topic_id
      t.integer :category_id
      t.text :title
      t.text :question
      t.text :icon
      t.integer :value
      t.text :snap_shot

      t.timestamps null: false
    end
  end
end
