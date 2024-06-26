class Fee < ApplicationRecord
  enum month: {
    ins: 0,
    sep: 9,
    oct: 10,
    nov: 11,
    dec: 12,
    jan: 1,
    feb: 2,
    mar: 3,
    apr: 4,
    may: 5,
    jun: 6,
    jul: 7,
    ago: 8
  }

  belongs_to :student
end
