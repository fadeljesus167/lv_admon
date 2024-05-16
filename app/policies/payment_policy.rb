class PaymentPolicy < BasePolicy
  def new
    record.biller? || record.admin?
  end

  def create
    record.biller? || record.admin?
  end
end