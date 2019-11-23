class UpdateColumnInBananas < ActiveRecord::Migration[5.2]
  def change
    change_column :bananas, :total, :integer, :default => 0
  end
end
