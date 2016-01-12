class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :customer
      t.integer :amount
      t.string :description
      t.string :currency

      t.timestamps null: false
    end
  end
end
