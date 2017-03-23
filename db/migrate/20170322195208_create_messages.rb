class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.belongs_to :user, foreign_key: true
      t.text :body
      t.references :messageable, polymorphic: true

      t.timestamps
    end
  end
end
