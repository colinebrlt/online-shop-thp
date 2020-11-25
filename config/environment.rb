# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['MAILJET_LOGIN'],
  :password => ENV['MAILJET_PWD'],
  :domain => 'gmail.com', # information à récupérer dans Adresses d'envoi
  :address => 'in-v3.mailjet.com', # Serveur SMTP
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
