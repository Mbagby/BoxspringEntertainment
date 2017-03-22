class AddPlanIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :card_token, :string
    add_column :users, :plan_id, :integer
    add_column :users, :end_date, :date
    add_column :users, :customer_id, :string
  end
end
