class PagesController < ApplicationController
  before_filter -> { @header = false }

  caches_action :splash

  def splash
  end

  def about
    @title = "About"
  end

  def policy
    @title = "Payment & Privacy Policy"
  end

  def terms
    @title = "Terms Of Use & Conditions"
  end

  def pricing
    @title = "Seat Pricing"
  end

  def support
    @title = "Contact & Support"
  end

  def sponsors
    @title = "Sponsors & Contributors"
  end

  def syllabus
    @title = "Class Syllabus"
  end
end
