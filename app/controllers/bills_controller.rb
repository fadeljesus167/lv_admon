class BillsController < ApplicationController
  def index
    @bills = Bill.all
  end

  def new
    billed_payments = []
    Bill.all.includes(:payment).each { |bill| billed_payments << bill.payment }
    @payments = Payment.excluding(billed_payments)
  end

  def create
    @bill = Bill.new(bill_params)

    if @bill.save
      redirect_to bills_path
    end
  end

  def generate
    @bill = Bill.new
    @payment = Payment.find(params[:id])
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
    params.require(:bill).permit(:payment_id, :bill_date, :delivered_date, :bill_reference, :status)
  end
end
