class CreateCategoryOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :category_options do |t|
      t.belongs_to :category, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.boolean :message_board
      t.boolean :comment_section

      t.timestamps
    end
  end
end
