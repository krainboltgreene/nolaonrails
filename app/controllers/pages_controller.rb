class PagesController < ApplicationController
  before_filter -> { @footer = true }

  def splash
  end

  def about
  end

  def policy
  end

  def terms
  end

  def pricing
  end

  def support
  end

  def sponsors
  end
end
