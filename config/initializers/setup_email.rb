ActionMailer::Base.smtp_settings = {
  :domain => "*.kosjourney.com",
  :address => "smtp.gmail.com",
  :user_name => APP['gmail_username'],
  :password => APP['gmail_password'],
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}