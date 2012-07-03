class PagesController < ApplicationController
  skip_before_filter :require_login
  skip_before_filter :require_header

  def splash
    @account = Account.new
  end

  def about
  end

  def contact
  end

  def prices
  end

  def policies
  end

  def alumni
  end

  def terms
  end
end
