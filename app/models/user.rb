class User < ApplicationRecord
  validates :username, presence: true

  enum role: {
    biller: 0,
    accountant: 1,
    admin: 2
  }

  has_secure_password
end
