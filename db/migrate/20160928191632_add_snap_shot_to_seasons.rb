class AddSnapShotToSeasons < ActiveRecord::Migration
  def change
    add_column :seasons, :snap_shot, :string
  end
end
