class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.date :payment_date, null: false
      t.string :issuing_bank, null: false
      t.string :reference, null: false
      t.string :receiving_bank, null: false
      t.decimal :amount, null: false, precision: 15, scale: 2
      t.boolean :verified, default: false

      t.timestamps
    end
    add_index :payments, :reference, unique: true
  end
end
