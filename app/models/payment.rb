class Payment < ApplicationRecord
  validates :payment_date, presence: true
  validates :issuing_bank, presence: true
  validates :reference, presence: true
  validates :receiving_bank, presence: true
  validates :amount, presence: true

  belongs_to :student
end
