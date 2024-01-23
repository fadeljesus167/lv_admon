class PaymentsController < ApplicationController
  def index
    @payments = Payment.all
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      redirect_to payments_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def verify
    @payment = Payment.find(params[:id])

    @payment.update(verified: !@payment.verified)

    pp @payment
  end

  private
  def payment_params
    params.require(:payment).permit(:payment_date, :issuing_bank, :reference, :receiving_bank, :amount, :payment_support, :student_id)
  end
end
