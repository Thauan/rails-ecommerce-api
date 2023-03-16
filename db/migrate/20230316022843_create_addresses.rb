class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :street, null: false
      t.string :neighborhood, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :country
      t.integer :number
      t.string :zip_code, null: false
      t.string :complement
      t.references :addressable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
