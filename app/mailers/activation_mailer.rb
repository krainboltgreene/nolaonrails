class ActivationMailer < ActionMailer::Base
  default from: "noreply@nolaonrails.com"

  def activation_needed_email(account)
    @account = account
    mail to: account.email
  end
end
