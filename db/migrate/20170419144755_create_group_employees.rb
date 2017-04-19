class CreateGroupEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :group_employees do |t|
      t.integer :group_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
