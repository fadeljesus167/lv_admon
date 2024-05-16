class VerificationPolicy < BasePolicy
  def verification
    record.accountant? || record.admin?
  end

  def verify
    record.accountant? || record.admin?
  end
end