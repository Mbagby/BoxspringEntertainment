class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.integer :hr_manager_id
      t.integer :assignee_id
      t.string :assignee_type
      t.integer :content_id
      t.string :content_type
      t.string :status

      t.timestamps
    end
  end
end
