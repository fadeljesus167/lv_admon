class VerificationsController < ApplicationController
  def verification
    @payments = Payment.where(verified: false).order(created_at: :desc).with_attached_payment_support
  end

  def verify
    @payment = Payment.find_by(id: params[:id])
    @payment.update(verified: true)

    redirect_to payments_path
  end
end
