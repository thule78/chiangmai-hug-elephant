#sendgrid follow https://medium.com/le-wagon/how-to-send-email-with-action-mailer-and-sendgrid-in-rails-5-32ed0c9167fd

ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: 587,
  domain: 'yourdomain.com',
  user_name: ENV['SENDGRID_USERNAME'],
  password: ENV['SENDGRID_PASSWORD'],
  authentication: :login,
  enable_starttls_auto: true
}
