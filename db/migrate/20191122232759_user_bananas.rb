class UserBananas < ActiveRecord::Migration[5.2]
  def change
    create_table :user_bananas do |t|
      t.integer :user_id
      t.integer :banana_id
    end
  end
end
