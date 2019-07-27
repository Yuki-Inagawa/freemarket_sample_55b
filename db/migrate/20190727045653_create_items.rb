class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false, index: true
      t.text :text, null: false
      t.integer :price, null: false
      t.string :state, null: false
      t.string :postage_type, null: false
      t.string :region, null: false
      t.string :shopping_date, null: false
      t.string :delivery_method, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
