class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user
      t.string :postal_code, null: false
      t.string :region, null: false
      t.string :city, null: false
      t.string :address_number, null:false
      t.string :building_name
      t.string :phone_number

      t.timestamps
    end
  end
end
