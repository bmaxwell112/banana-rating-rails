class CreateBananas < ActiveRecord::Migration[5.2]
  def change
    create_table :bananas do |t|
      t.integer :ripe, :default => 0
      t.integer :notripe, :default => 0
      t.boolean :flagged, :default => false      
      t.timestamps
    end
  end
end
