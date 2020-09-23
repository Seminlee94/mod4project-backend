class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :category
      t.string :sub_category
      t.integer :quantity
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
