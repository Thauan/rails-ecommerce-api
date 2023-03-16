class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands, id: :uuid do |t|
      t.string :name, null: false
      t.text :brief, null: true
      t.string :slug, null: false
      t.string :web_address, null: true
      t.boolean :active, default: false
      
      t.timestamps
    end
  end
end
