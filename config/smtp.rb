SMTP_SETTINGS = {
  address: ENV.fetch("smtp.sendgrid.net"), # example: "smtp.sendgrid.net"
  authentication: :plain,
  domain: ENV.fetch("heroku.com"), # example: "heroku.com"
  enable_starttls_auto: true,
  password: ENV.fetch("fwvjnnsk4691"),
  port: "587",
  user_name: ENV.fetch("app48714542@heroku.com")
}
