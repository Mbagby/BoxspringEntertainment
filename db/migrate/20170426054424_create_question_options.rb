class CreateQuestionOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :question_options do |t|
      t.integer :question_id 
      t.string :option_name
      t.string :value
      t.boolean :is_answer, default: false

      t.timestamps
    end
  end
end
