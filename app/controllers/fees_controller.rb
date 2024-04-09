class FeesController < ApplicationController
  def create
    @fee = Fee.new(fee_params)
    @fee.bills.each { |bill| pp bill.save }
    
    if @fee.save
      redirect_to student_path(@fee.student)
    end
  end

  private
  def fee_params
    params.require(:fee).permit(:student_id, :month, bills_attributes: [:payment_id, :bill_date, :delivered_date, :bill_reference, :bill_description])
  end
end