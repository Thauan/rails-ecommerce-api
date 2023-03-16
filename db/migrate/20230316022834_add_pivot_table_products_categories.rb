class AddPivotTableProductsCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :products_categories, id: false do |t|
      t.integer :product_id
      t.integer :category_id
    end

    add_index :products_categories, [:product_id, :category_id]
  end
end
