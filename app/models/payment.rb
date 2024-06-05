class Payment < ApplicationRecord
  validates :payment_date, presence: true, comparison: { less_than_or_equal_to: Date.today }
  validates :issuing_bank, presence: true
  validates :reference, presence: true, uniqueness: true
  validates :receiving_bank, presence: true
  validates :amount, presence: true

  has_one_attached :payment_support

  belongs_to :student
  has_one :bill, dependent: :destroy
  has_many :fees, through: :bill

  enum payment_type: {
    transf: 0,
    cash: 1,
    zelle: 2
  }
end
