class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.integer :hr_manager_id
      t.string :name

      t.timestamps
    end
  end
end
