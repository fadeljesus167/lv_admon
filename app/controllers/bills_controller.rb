class BillsController < ApplicationController
  def index
    @bills = Bill.all
  end

  def new
    authorize_user!(current_user)
    billed_payments = []
    Bill.all.includes(:payment).each { |bill| billed_payments << bill.payment }
    @payments = Payment.where(verified: true).excluding(billed_payments)
  end

  def create
    authorize_user!(current_user)
    @bill = Bill.new(bill_params)
    @bill.bill_date = Date.today
    
    if @bill.save
      redirect_to bills_path
    end
  end

  def generate
    authorize_user!(current_user)
    @payment = Payment.find(params[:id])
    @student = @payment.student
    @bill = Bill.new
    @bill.fees = [Fee.new]
    paid_months = @student.fees.pluck(:month)
    bill_months = Fee.months.keys
    partial_payment = calculate_partial_payments(@student.payments)
    pp partial_payment
    @months = partial_payment + (bill_months - paid_months)
  end

  def edit
    @bill = Bill.find(params[:id])
  end

  def update
    authorize_user!(current_user)
    @bill = Bill.find(params[:id])

    if @bill.update(bill_params)
      redirect_to bills_path
    else
      render :edit
    end
  end

  private
  def bill_params
    params.require(:bill).permit(:payment_id, :bill_date, :delivered_date, :bill_type, :bill_reference, :status, :bill_description, fees_attributes: [:student_id, :month])
  end

  def calculate_partial_payments(payments)
    last_payment = payments.second_to_last
    total_amount = last_payment.amount/last_payment.rate
    unless (total_amount.to_f/last_payment.student.quota).eql?(0.0)
      [last_payment.student.fees.last.month]
    end
  end
end
