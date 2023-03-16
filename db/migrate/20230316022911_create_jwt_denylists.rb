class CreateJwtDenylists < ActiveRecord::Migration[7.0]
  def change
    create_table :jwt_denylists, id: :uuid do |t|
      t.string :jti, null: false
      t.datetime :exp, null: false
    end
    
    add_index :jwt_denylists, :jti
  end
end
