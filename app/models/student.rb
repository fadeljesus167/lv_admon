class Student < ApplicationRecord
  has_many :payments
  has_many :fees
end
