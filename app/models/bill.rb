class Bill < ApplicationRecord
  validates :bill_date, presence: true
  validates :bill_reference, presence: true

  enum status: %i( processing canceled completed )

  belongs_to :payment
end
