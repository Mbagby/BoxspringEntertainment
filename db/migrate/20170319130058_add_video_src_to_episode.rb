class AddVideoSrcToEpisode < ActiveRecord::Migration[5.0]
  def change
    add_column :episodes, :video_src, :string
  end
end
