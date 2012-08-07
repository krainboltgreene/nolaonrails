ignore /\/\..*/
ignore /file/
ignore 'config.ru'

layout 'layout.html.slim'

helpers do
  def view_title
    "Nola On Rails"
  end

  def view_description
    """
    NOLA on Rails is a local (to New Orleans) class for learning Ruby
    on Rails. Learn how to build a web application!
    """
  end

  def view_keywords
    %w[learn application rails ruby programming education teaching].join ", "
  end

  def view_author
    "Kurtis Rainbolt-Greene (@krainboltgreene)"
  end

  def view_analytics_account
    "UA-29112991-1"
  end

  def view_analytics_domain
    "nolaonrails.com"
  end

  def mail_to_address
    "mailto:register@nolaonrails.com"
  end

  def small(text)
    "<small>#{text}</small>"
  end

  def build_career_text
    """
    """
  end

  def bring_ideas_text
    """
    """
  end

  def jump_start_text
    """
    """
  end
end
