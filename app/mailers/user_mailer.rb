class UserMailer < ApplicationMailer
  def company_invite(invite)
    @invite = invite

    mail(to: @invite.email, subject: 'Welcome to My Awesome Site')
  end
end