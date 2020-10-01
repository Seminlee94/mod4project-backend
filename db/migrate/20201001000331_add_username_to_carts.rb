class AddUsernameToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :username, :string
  end
end
