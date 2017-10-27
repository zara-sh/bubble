ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_UN'],
  :password => ENV['SENDGRID_PS'],
  :domain => 'aroundthecorner.me',
  :address => 'smtp.sendgrid.net',
  :port => 25,
  :authentication => :plain,
  :enable_starttls_auto => true
}

