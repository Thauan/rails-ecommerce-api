class CreateVariantTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :variant_types, id: :uuid do |t|
      t.string :name
      t.string :reference_code
      
      t.timestamps
    end
  end
end
