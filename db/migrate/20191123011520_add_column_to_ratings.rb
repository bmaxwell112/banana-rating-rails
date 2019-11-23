class AddColumnToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :ripe, :boolean
  end
end
