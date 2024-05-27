class Bill < ApplicationRecord
  validates :bill_date, presence: true
  validates :bill_reference, presence: true, uniqueness: true

  enum status: { processing: 0, canceled: 1, completed: 2 }
  enum bill_type: { transfer: 0, credit: 1, cash: 2}

  belongs_to :payment
  has_many :fees

  accepts_nested_attributes_for :fees
end
