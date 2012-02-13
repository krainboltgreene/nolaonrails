class AccountsController < ApplicationController
  before_filter :require_login, only: [:edit, :index, :show, :dashboard]
  before_filter :new_account, only: [:new, :create]
  before_filter :find_account, only: [:show, :edit, :update, :dashboard]
  before_filter :find_accounts, only: [:index]
  before_filter :decorate_account, only: [:show, :index, :dashboard]
  before_filter :decorate_accounts, only: [:index]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.slim
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1/dashboard
  # GET /accounts/1/dashboard.json

  def dashboard
    respond_to do |format|
      format.html # dashboard.html.slim
      format.json { render json: @account }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.slim
      format.json { render json: @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
    @account = Account.new

    respond_to do |format|
      format.html # new.html.slim
      format.json { render json: @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.json
  def create
    respond_to do |format|
      if @account.save
        login @account.email, params[:account][:password]
        format.html { redirect_to dashboard_account_path(current_user), notice: "You're all setup!" }
        format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new", error: 'Something went wrong!' }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
    end
  end

  private

  def new_account
    @account = Account.new params[:account]
  end

  def find_account
    if params[:id].present?
      @account = Account.find_by_id params[:id]
      redirect_to dashboard_account_path current_user unless @account.present?
    else
      redirect_back
    end
  end

  def find_accounts
    @accounts = Account.all
  end

  def decorate_account
    @account = AccountDecorator.new @account if @account.present?
  end

  def decorate_accounts
    @accounts = AccountDecorator.new @accounts if @accounts.present?
  end
end
