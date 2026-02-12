module ApplicationHelper
    def logged_in?
        session[:user_id] && User.exists?(session[:user_id])
    end

    def current_user
        user ||= User.find(session[:user_id])
    end

    def per_verify_payments
        Payment.where(verified: false).exists?
    end

    def per_generate_bills
        Payment.ready_for_billing.exists?
    end

    def authorized?(record, query)
        policy_class = "#{record.is_a?(Class) ? record : record.class}Policy".constantize
        policy_class.new(current_user).send("#{query}?")
    rescue NameError
        false
    end
end
