class SessionsController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]
  skip_before_filter :require_card, only: [:new, :create, :destroy]

  def new
    redirect_to account_courses_path current_account if logged_in?
  end

  def create
    auto_login Account.create_with_omniauth omniauth if omniauth
    redirect_to dashboard_account_path(current_user)
  end

  def destroy
    logout
    redirect_to root_url
  end

  private

  def omniauth
    env["omniauth.auth"]
  end
end
