class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :variants, id: :uuid do |t|
      t.string :value, null: true
      t.integer :quantity, null: true
      t.string :meta_datas, null: true

      t.references :variant_type, null: false, foreign_key: true, type: :uuid
      
      t.timestamps
    end
  end
end
