class CreateAssetLibraries < ActiveRecord::Migration[5.0]
  def change
    create_table :asset_libraries do |t|
      t.belongs_to :user, foreign_key: true
      t.string :file

      t.timestamps
    end
  end
end
