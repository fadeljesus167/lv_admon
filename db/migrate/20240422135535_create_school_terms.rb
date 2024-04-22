class CreateSchoolTerms < ActiveRecord::Migration[7.1]
  def change
    create_table :school_terms do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps
    end

    add_reference(:payments, :school_term, null: false, foreign_key: true)
  end
end
