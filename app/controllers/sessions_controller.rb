class SessionsController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]
  skip_before_filter :require_card, only: [:new, :create, :destroy]

  def new
    redirect_to account_courses_path current_account if logged_in?
  end

  def create
    if env["omniauth.auth"]
      auto_login Account.from_omniauth env["omniauth.auth"]
    end
    if current_user
      redirect_to dashboard_account_path(current_user)
    else
      flash.now[:error] = "Your password or username was incorrect. Please try again."
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
