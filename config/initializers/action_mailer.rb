#require 'smtp_tls'

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "mail.ephekt.com",
  :port => 2525,
  :authentication => :plain,
  :user_name => "simply@ephekt.com",
  :password => "virtent88"
}
ActionMailer::Base.perform_deliveries = true
#ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.default_charset = "utf-8"
ActionMailer::Base.default_content_type = "text/html"