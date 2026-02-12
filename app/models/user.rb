class User < ApplicationRecord
  validates :username, presence: true

  enum :role, [:biller, :accountant, :admin]

  has_secure_password
end
