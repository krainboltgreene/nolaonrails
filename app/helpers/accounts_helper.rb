module AccountsHelper

  PLACEHOLDERS = {
    email: "jqpublic@email.com",
    name: "John Public",
    password: "thisisaverysecretpassword"
  }

  HINTS = {
    email: "Enter your email address",
    name: "Enter your full name",
    password: "Your password must be at least 8 characters long",
  }

  def email_options
    {
      placeholder: PLACEHOLDERS[:email],
      input_html: { class: "span4" },
      hint: HINTS[:email],
      required: true
    }
  end

  def name_options
    {
      placeholder: PLACEHOLDERS[:name],
      input_html: { class: "span4" },
      hint: HINTS[:name],
      required: true
    }
  end

  def password_options
    {
      placeholder: PLACEHOLDERS[:password],
      input_html: { class: "span4" },
      required: true
    }
  end

  def confirmation_options
    {
      placeholder: PLACEHOLDERS[:password],
      input_html: { class: "span4" },
      label: "&nbsp;",
      hint: HINTS[:password],
      required: true
    }
  end

  def role_options
    {
      "I'm a regular person" => 1,
      "I'm from a company in New Orleans" => 2,
      "I'm a Launchpad Member" => 3
    }
  end
end
