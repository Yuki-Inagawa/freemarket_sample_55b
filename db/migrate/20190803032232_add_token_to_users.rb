class AddTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Token, :string
  end
end
