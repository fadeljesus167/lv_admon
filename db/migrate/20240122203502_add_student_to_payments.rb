class AddStudentToPayments < ActiveRecord::Migration[7.1]
  def change
    add_reference :payments, :student, null: false, foreign_key: true, default: 1
  end
end
