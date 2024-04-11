class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :self_introduction
      t.string :icon_image

      t.timestamps
    end
  end
end
