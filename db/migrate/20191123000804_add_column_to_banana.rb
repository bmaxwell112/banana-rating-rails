class AddColumnToBanana < ActiveRecord::Migration[5.2]
  def change
    add_column :bananas, :total, :integer
  end
end
