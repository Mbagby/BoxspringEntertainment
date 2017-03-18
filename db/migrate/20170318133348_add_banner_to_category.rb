class AddBannerToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :banner, :string
  end
end
