class AccountsController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create, :alumni]

  def new
    @account = Account.new
  end

  def create
    @account = Account.new params[:account]
    if @account.valid?
      @account.save
      auto_login @account
      redirect_to payment_account_path current_user
    else
      log_errors
      render :new
    end
  end

  def update
    @account = current_user
    respond_to do |format|
      if params[:account][:stripe_token]
        token = params[:account][:stripe_token]
        stripe_attributes = { description: @account.name, email: @account.email, card: token}
        customer = Stripe::Customer.create
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

  def payment
    if current_account.stripe_token.present?
      flash[:notice] = "You've already entered your card information."
      redirect_to courses_path
    else
      @account = current_user
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
