ActionMailer::Base.smtp_settings = {
    :port =>           '587',
    :address =>        'smtp.mandrillapp.com',
    :user_name =>      ENV['app37952668@heroku.com'],
    :password =>       ENV['fFgt6-YOhPmpQcRTcrhKsQ'],
    :domain =>         'heroku.com',
    :authentication => :plain
}

ActionMailer::Base.delivery_method = :smtp
