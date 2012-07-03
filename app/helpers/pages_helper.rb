module PagesHelper

  def opening_date
  end

  def opening_day_alert
    "Our current opening date is on <strong>#{opening_date}</strong>. Feel free to signup for our Newsletter with the belwo form for more details and updates."
  end

  def learn_essentials_text
    """
    In this 6 week class I'll be teaching you all you need to know in order
    to write your own Rails applications. I'll give you an introduction to
    the MVC framework, tools that make it all easier, best practices, and
    development patterns. <strong>No prior programming experience
    required</strong>.
    """
  end

  def build_a_career_text
    """
    With this class you'll be able to make yourself a target for <strong>high
    paying jobs</strong>. With the growing community of Rails developers in
    New Orleans you'll find yourself among good company. These are the skills
    of a career in programming.
    """
  end

  def launch_dreams_text
    """
    The Rails web framework is a gateway to further software development
    opportunities. With it you can bootstrap your own ideas from prototypes
    to functional application. We'll give you the tools to launch your
    dreams. This class will give you insight into the web.
    """
  end

  def policy_change_text
    """
    From time to time we may make adjustments to this privacy policy.
    Changes to this policy will be made at Nola On Rails's sole
    discretion. Nola On Rails's users are encouraged to check this
    privacy policy for such changes. Your continued use of this site
    following changes to this privacy policy constitutes your acceptance
    of the changes.
    """
  end

  def location_subtitle_text
    """
    The 1st Floor Rear Conference Room @ The IP Building
    """
  end

  def map_source_url
    domain = "http://maps.google.com/maps?"
    parameters = [
      "f=q",
      "source=s_q",
      "hl=en",
      "ie=UTF8",
      "ll=29.958093,-90.069164",
      "spn=0.002006,0.004117",
      "t=m",
      "z=14",
      "iwloc=A",
      "cid=3774553948737820622",
      "output=embed"
    ].join("&amp;")
    raw domain + parameters
  end
end
