class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_header
  before_filter -> { @footer = true }
  before_filter :require_login


  private

  def current_account
    AccountDecorator.new current_user
  end

  def require_card
    unless current_account.stripe_customer_token.present?
      flash[:error] = "You need to enter your card details."
      redirect_to card_account_path current_account
    end
  end

  def require_header
    @header = true
  end
end
