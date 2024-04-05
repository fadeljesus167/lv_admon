class Bill < ApplicationRecord
  validates :bill_date, presence: true
  validates :bill_reference, presence: true, uniqueness: true

  enum status: { processing: 0, canceled: 1, completed: 2 }
  
  belongs_to :fee
  belongs_to :payment
end
