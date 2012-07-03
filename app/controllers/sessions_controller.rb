class SessionsController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]

  def new
  end

  def create
    email = params[:session][:email]
    password = params[:session][:password]
    remember_me = params[:session][:remember_me]
    account = login email, password, remember_me
    if account.present?
      redirect_to dashboard_account_path(current_user)
    else
      render :new
    end
  end

  def destroy
    logout
  end
end
