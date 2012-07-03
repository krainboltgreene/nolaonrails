module ApplicationHelper
  def view_title(title = nil)
    if title
      [configatron.app.name, '-', title].join ' '
    else
      configatron.app.name
    end
  end

  def view_description(description = nil)
    if description
      [configatron.app.description, description].join "\n"
    else
      configatron.app.description
    end
  end

  def view_keywords(keywords = nil)
    if keywords
      configatron.app.keywords + keywords
    else
      configatron.app.keywords
    end.join(',')
  end

  def view_author(author = nil)
    if author
      configatron.app.author + author
    else
      configatron.app.author
    end.join(' ')
  end

  def view_analytics_account
    ENV['ANALYTICS_KEY']
  end

  def view_analytics_domain
    ENV['ANALYTICS_DOMAIN']
  end

  def page_header(title)
    render partial: 'pageheader', locals: { title: title }
  end

  def form_input_span
    "span4"
  end

  def nav_item(text, path)
    if current_page?(path)
      active_class = "active"
      path = "#"
    end

    content_tag :li, class: active_class do
      link_to text, path
    end
  end

  def current_account
    AccountDecorator.new current_user
  end

  def link_to_facebook_connect
    link_to "/auth/facebook", class: "btn" do
      raw "<i class='icon-facebook'></i> Facebook Login"
    end
  end

  def link_to_twitter_connect
    link_to "/auth/twitter", class: "btn" do
      raw "<i class='icon-twitter'></i> Twitter Login"
    end
  end

  def view_has_header?
    @header
  end

  def view_has_footer?
    @footer
  end
end
