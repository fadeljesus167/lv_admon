class Authentication::SessionsController < ApplicationController
  skip_before_action :protect_pages

  def new
    unless session[:user_id].nil?
      redirect_to students_path
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to login_path
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to students_path
    else
      render :new, alert: 'Invalid login', status: :unprocessable_entity
    end
  end
end
