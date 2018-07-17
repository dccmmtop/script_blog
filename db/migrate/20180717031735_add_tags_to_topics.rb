class AddTagsToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :tags, :string
  end
end
