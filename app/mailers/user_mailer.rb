
class UserMailer < ActionMailer::Base
  default from: 'santa@hairbnb.com'

  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to Hairbnb')
    # This will render a view in `app/views/user_mailer`!
  end
end

