class ApplicationController < ActionController::Base
  include Authorization
  before_action :protect_pages

  private
  def protect_pages
    if session[:user_id].nil?
      redirect_to login_path, alert: t('authentication_error')
    end
  end

  def current_user
    user ||= User.find(session[:user_id])
  end
end
