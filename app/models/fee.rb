class Fee < ApplicationRecord
  enum month: {
    ins: 0,
    jan: 1,
    feb: 2,
    mar: 3,
    apr: 4,
    may: 5,
    jun: 6,
    jul: 7,
    ago: 8,
    sep: 9,
    oct: 10,
    nov: 11,
    dec: 12,
  }

  belongs_to :student
  has_many :bills
end
