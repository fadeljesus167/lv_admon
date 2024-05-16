class BillPolicy < BasePolicy
  def new
    record.biller? || record.admin?
  end
  
  def generate
    record.biller? || record.admin?
  end

  def create
    record.biller? || record.admin?
  end

  def update
    record.biller? || record.admin?
  end
end