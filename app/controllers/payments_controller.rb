class PaymentsController < ApplicationController
  def index
    @payments = Payment.all.order(created_at: :desc).with_attached_payment_support
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      respond_to do |format|
        format.html { redirect_to payments_path }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def payment_params
    params.require(:payment).permit(:payment_date, :issuing_bank, :reference, :receiving_bank, :amount, :payment_support, :student_id)
  end
end