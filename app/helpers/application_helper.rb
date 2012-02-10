module ApplicationHelper
  APPLICATION = {
    name: "NOLA ON RAILS",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    keywords: %w[],
    authors: %w[]
  }

  def view_title(title = nil)
    if title
      [APPLICATION[:name], '-', title].join(' ')
    else
      APPLICATION[:name]
    end
  end

  def view_description(description = nil)
    if description
      [APPLICATION[:description], description].join('\n')
    else
      APPLICATION[:description]
    end
  end

  def view_keywords(keywords = nil)
    if keywords
      APPLICATION[:keywords] + keywords
    else
      APPLICATION[:keywords]
    end.join(',')
  end

  def view_has_header?
    @header
  end

  def view_has_footer?
    @footer
  end
end
