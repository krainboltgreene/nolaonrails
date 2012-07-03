class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_header
  before_filter -> { @footer = true }
  before_filter :require_login


  private

  def require_header
    @header = true
  end
end
