class AddPivotTableBrandProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :brand_products, id: false do |t|
      t.integer :product_id
      t.integer :brand_id
    end

    add_index :brand_products, [:product_id, :brand_id]
  end
end
