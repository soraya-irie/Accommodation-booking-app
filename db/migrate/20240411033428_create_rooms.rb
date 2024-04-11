class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :name
      t.text :introduction
      t.integer :price_per_night
      t.string :address
      t.string :room_image

      t.timestamps
    end
  end
end
