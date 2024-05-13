module ApplicationHelper
    def logged_in?
        session[:user_id] && User.exists?(session[:user_id])
    end
end
