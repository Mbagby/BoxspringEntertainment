class AddSnapShotToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :snap_shot, :string
  end
end
