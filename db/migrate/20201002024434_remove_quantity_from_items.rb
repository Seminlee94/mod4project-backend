class RemoveQuantityFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :quantity
  end
end
