module ApplicationHelper
  APPLICATION = {
    name: "NOLA ON RAILS",
    description: %q[NOLA on Rails (shortned to NOR) is a local (to New Orleans) class for learning Ruby on Rails.],
    keywords: %w[new orleans rails lousiana ruby class learning local student study career],
    author: ["Kurtis Rainbolt-Greene (@krainboltgreene)"]
  }

  def view_title(title = nil)
    if title
      [APPLICATION[:name], '-', title].join ' '
    else
      APPLICATION[:name]
    end
  end

  def view_description(description = nil)
    if description
      [APPLICATION[:description], description].join "\n"
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

  def view_author(author = nil)
    if author
      APPLICATION[:author] + author
    else
      APPLICATION[:author]
    end.join(' ')
  end

  def view_has_header?
    @header
  end

  def view_has_footer?
    @footer
  end
end
