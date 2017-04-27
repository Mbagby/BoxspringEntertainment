class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.integer :hr_manager_id
      t.integer :content_id
      t.string :content_type
      t.text :description

      t.timestamps
    end
  end
end
