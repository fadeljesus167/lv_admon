module ApplicationHelper
    def logged_in?
        session[:user_id] && User.exists?(session[:user_id])
    end

    def per_verify_payments
        Payment.where(verified: false).count.eql?(0) ? false : true
    end

    def per_generate_bills
        Payment.where(verified: true).count.eql?(0) ? false : true
    end
end
