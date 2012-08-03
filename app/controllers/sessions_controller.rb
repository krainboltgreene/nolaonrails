class SessionsController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]
  skip_before_filter :require_card, only: [:new, :create, :destroy]

  def new
    redirect_to account_courses_path current_account if logged_in?
  end

  def create
    account = Account.find_or_build_with_omniauth omniauth if omniauth
    if account.present? && account.valid?
      account.save if account.new_record?
      auto_login account
      redirect_to dashboard_account_path(current_user)
    else
      flash.now[:error] = "You could not be logged in due to an error"
      render :new
    end
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
