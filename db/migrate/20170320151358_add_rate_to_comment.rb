class AddRateToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :rate, :integer, default: 0
  end
end
