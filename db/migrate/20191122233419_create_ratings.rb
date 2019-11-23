class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :banana_id 
    end
  end
end
