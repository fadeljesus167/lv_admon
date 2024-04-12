class CreateBills < ActiveRecord::Migration[7.1]
  def change
    create_table :bills do |t|
      t.references :payment, null: false, foreign_key: true, default: 1
      t.integer :status, null: false, default: 0
      t.date :bill_date, null: false
      t.date :delivered_date
      t.string :bill_reference, null: false
      t.string :bill_description, null: false
      t.integer :bill_type, null: false, default: 0

      t.timestamps
    end
    add_index :bills, :bill_reference, unique: true
  end
end
