class CreateFees < ActiveRecord::Migration[7.1]
  def change
    create_table :fees do |t|
      t.belongs_to :student, null: false, foreign_key: true
      t.belongs_to :bill, null: false, foreign_key: true
      t.integer :month, null: false

      t.timestamps
    end
  end
end
