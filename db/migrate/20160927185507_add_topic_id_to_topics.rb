class AddTopicIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :topic_id, :integer
  end
end
