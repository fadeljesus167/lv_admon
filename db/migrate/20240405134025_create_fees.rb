class CreateFees < ActiveRecord::Migration[7.1]
  def change
    create_table :fees do |t|
      t.belongs_to :student, null: false, foreign_key: true
      t.integer :month, null: false

      t.timestamps
    end
    add_reference :bills, :fee, null: false, foreign_key: true
  end
end
