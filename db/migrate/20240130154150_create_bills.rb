class CreateBills < ActiveRecord::Migration[7.1]
  def change
    create_table :bills do |t|
      t.references :payment, null: false, foreign_key: true, default: 1
      t.integer :status, null: false, default: 0
      t.boolean :delivered, null: false, default: false
      t.date :bill_date, null: false
      t.date :delivered_date
      t.string :bill_reference, null: false

      t.timestamps
    end
  end
end