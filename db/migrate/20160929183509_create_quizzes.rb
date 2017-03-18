class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :quiz_id
      t.integer :episode_id
      t.integer :series_id
      t.integer :topic_id
      t.integer :category_id
      t.text :title
      t.text :description
      t.text :icon
      t.integer :score
      t.text :snap_shot
      t.text :answer
      t.integer :correctness
      t.timestamps null: false
    end
  end
end
