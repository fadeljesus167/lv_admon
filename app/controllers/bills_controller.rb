class BillsController < ApplicationController
  def index
    @bills = Bill.all
  end

  def new
    @payments = Payment.where(verified: true).order(created_at: :desc)
  end

  def create
    Bill.create(bill_params)
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
