class AddHiddenToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :hidden, :boolean
  end
end
