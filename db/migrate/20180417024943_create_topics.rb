class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :body
      t.integer :reading_count

      t.timestamps
    end
  end
end
