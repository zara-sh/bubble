ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => 25,
  :domain => "mysite.com",
  :authentication => :plain,
  :user_name => ENV['SENDGRID_UN'],
  :password => ENV['SENDGRID_PS']
}
