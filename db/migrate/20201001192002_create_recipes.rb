class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :picture
      t.string :source_url
      t.string :ingredients
      t.integer :user_id

      t.timestamps
    end
  end
end
