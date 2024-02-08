class Payment < ApplicationRecord
  validates :payment_date, presence: true
  validates :issuing_bank, presence: true
  validates :reference, presence: true
  validates :receiving_bank, presence: true
  validates :amount, presence: true

  has_one_attached :payment_support

  belongs_to :student
  has_one :bill
end
