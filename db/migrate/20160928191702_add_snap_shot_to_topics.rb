class AddSnapShotToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :snap_shot, :string
  end
end
