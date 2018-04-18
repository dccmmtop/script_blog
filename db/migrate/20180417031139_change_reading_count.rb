class ChangeReadingCount < ActiveRecord::Migration[5.1]
  def change
    change_column :topics,:reading_count,:integer,:default => 0
  end
end
