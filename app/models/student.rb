class Student < ApplicationRecord
  has_many :payments
  has_many :bills, through: :payments
end
