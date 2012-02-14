class PagesController < ApplicationController
  before_filter -> { @footer = true }

  caches_action :splash

  def splash
    render stream: true
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
