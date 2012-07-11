class AccountsController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create, :alumni]

  def new
    @account = Account.new
    @account = AccountDecorator.new @_account
  end

  def create
    @_account = Account.new params[:account]
    @account = AccountDecorator.new @_account
    if @_account.valid?
      @_account.save
      auto_login @account
      redirect_to card_account_path current_user
    else
      log_errors
      render :new
    end
  end

  def update
    @account = current_account
    respond_to do |format|
      if params[:account][:stripe_token]
        token = params[:account][:stripe_token]
        customer_attributes = {
          description: @account.name,
          email: @account.email,
          card: token
        }
        logger.info "Creating a Stripe customer with current account:"
        logger.info "  account: #{current_account.to_json}"
        logger.info "  customer: #{customer_attributes.to_json}"
        customer = Stripe::Customer.create customer_attributes
        logger.info "  return: #{customer.to_json}"
        @account.update_attribute :stripe_customer_token, customer.id
      end

      if @account.update_attributes(params[:account])
        format.html { redirect_to edit_account_path(@account) }
        format.json { head :ok }
      else
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

  def alumni
    @_accounts = Course.all.map(&:alumni).flatten
    @accounts = AccountDecorator.decorate @_accounts
  end

  private

  def log_errors
    logger.info "Account validation errors:"
    logger.info @account.errors.full_messages.map { |e| "  * " + e}.join "\n"
    logger.info @account.inspect
  end
end
