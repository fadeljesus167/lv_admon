class Payment < ApplicationRecord
  validates :payment_date, presence: true, comparison: { less_than_or_equal_to: Date.today }
  validates :issuing_bank, presence: true
  validates :reference, presence: true, uniqueness: true
  validates :receiving_bank, presence: true
  validates :amount, presence: true

  has_one_attached :payment_support

  belongs_to :student
  has_one :bill, dependent: :destroy
  has_many :fees, through: :bill, dependent: :destroy

  enum :payment_type, [ :transf, :cash, :zelle ]

  scope :without_bill, -> { left_outer_joins(:bill).where(bills: { id: nil }) }
  scope :ready_for_billing, -> { where(verified: true).without_bill }
end
