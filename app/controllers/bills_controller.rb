class BillsController < ApplicationController
  def index
    @bills = Bill.all
  end

  def new
    billed_payments = []
    Bill.all.includes(:payment).each { |bill| billed_payments << bill.payment }
    @payments = Payment.where(verified: true).excluding(billed_payments)
  end

  def create
    @bill = Bill.new(bill_params)

    if @bill.save
      redirect_to bills_path
    end
  end

  def generate
    @payment = Payment.find(params[:id])
    @student = @payment.student
    @fee = Fee.new
    @fee.bills.build
  end

  def show
    @bill = Bill.find(params[:id])
  end

  def update
    @bill = Bill.find(params[:id])

    if @bill.update(bill_params)
      redirect_to bills_path
    else
      render :show
    end
  end

  private
  def bill_params
    params.require(:bill).permit(:payment_id, :bill_date, :delivered_date, :bill_reference, :status, :bill_description)
  end
end
