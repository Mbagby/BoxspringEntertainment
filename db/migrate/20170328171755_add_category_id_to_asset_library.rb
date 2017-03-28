class AddCategoryIdToAssetLibrary < ActiveRecord::Migration[5.0]
  def change
    add_column :asset_libraries, :category_id, :integer
  end
end
