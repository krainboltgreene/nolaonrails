module AccountsHelper
  def expiration_input_options
    {
      as: :date,
      start_year: Date.today.year,
      end_year: Date.today.year + 12,
      discard_day: true,
      use_month_numbers: true,
      order: [:month, :year],
      input_html: { class: 'span1' }
    }
  end

  def cvc_input_options
    {
      label: "CVC",
      placeholder: "###",
      input_html: { class: "span1" }
    }
  end

  def card_form_text
    """
    We'll use your card only when you enroll in a course.
    We don't store your card information on our servers.
    Your card information is sent securely to a payment processor.
    #{link_to "Read more details here.", controller: :pages, action: :policies}
    """
  end
end
