module AccountsHelper
  def expiration_input_options
    {
      as: :date,
      start_year: Date.today.year,
      end_year: Date.today.year + 12,
      discard_day: true,
      use_month_numbers: true,
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
end
