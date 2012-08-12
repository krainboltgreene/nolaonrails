class AccountsController < ApplicationController
  skip_before_filter :require_login, only: [:alumni]
  skip_before_filter :require_card, only: [:update, :card]

  def new
    @_account = Account.new
  end

  def create
    @_account = Account.new params[:account]

  end

  def update
    respond_to do |format|
      if params[:account][:stripe_token]
        token = params[:account][:stripe_token]
        customer_attributes = {
          description: current_account.name,
          email: current_account.email,
          card: token
        }
        logger.info "Creating a Stripe customer with current account:"
        logger.info "  account: #{current_account.to_json}"
        logger.info "  customer: #{customer_attributes.to_json}"
        customer = Stripe::Customer.create customer_attributes
        logger.info "  return: #{customer.to_json}"
        current_account.update_attribute :stripe_customer_token, customer.id
      end

      if current_account.update_attributes(params[:account])
        format.html { redirect_to edit_account_path(current_account) }
        format.json { head :ok }
      else
        @account = current_account
        log_errors
        format.html { render :edit }
        format.json { head :conflict }
      end
    end
  end

  def card
    if current_account.stripe_token.present?
      redirect_to courses_path
    else
      @account = current_account
    end
  end

  def dashboard
    redirect_to courses_path
  end

  private

  def log_errors
    logger.info "Account validation errors:"
    logger.info @account.errors.full_messages.map { |e| "  * " + e}.join "\n"
    logger.info @account.inspect
  end
end
