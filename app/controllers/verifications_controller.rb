class VerificationsController < ApplicationController
  def verification
    authorize_user!(current_user)
    @payments = Payment.where(verified: false).order(created_at: :desc).with_attached_payment_support
  end

  def verify
    authorize_user!(current_user)
    @payment = Payment.find_by(id: params[:id])
    @payment.update(verified: true)

    respond_to do |format|
      format.html { redirect_to payments_path }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@payment) }
    end
  end
end
