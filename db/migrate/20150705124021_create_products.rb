class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.references :category, index: true, foreign_key: true
      t.integer :sub_category_id
      t.timestamps null: false
    end
  end
end
