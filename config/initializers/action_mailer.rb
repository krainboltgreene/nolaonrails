if Rails.env.production? || Rails.env.staging?
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => 'www.nolaonrails.com'
  }
  Rails.logger.info ActionMailer::Base.smtp_settings
  raise
  ActionMailer::Base.delivery_method = :smtp
end
