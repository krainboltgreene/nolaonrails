class SessionsController < ApplicationController
  before_filter -> { @header = false }, only: [:new, :create]
  before_filter -> { redirect_to dashboard_account_path(current_user) if logged_in? }, only: [:new, :create]

  # GET /sessions/new
  # GET /sessions/new.json
  def new
    respond_to do |format|
      format.html # new.html.slim
    end
  end

  # POST /sessions
  # POST /sessions.json
  def create
    respond_to do |format|
      if login(params[:session][:email], params[:session][:password], params[:session][:remember_me])
        format.html { redirect_to edit_account_path(current_user), notice: 'You have been logged in.' }
        format.json { render json: @session, status: :created, location: @account }
      else
        format.html { flash[:notice] = "You seem to have entered the wrong email or password."; render action: "new" }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    logout
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end
