class AddSnapShotToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :snap_shot, :string
  end
end
