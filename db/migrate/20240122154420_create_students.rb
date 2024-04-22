class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :grade, null: false
      t.integer :quota
      t.date :entry_date

      t.timestamps
    end
  end
end
