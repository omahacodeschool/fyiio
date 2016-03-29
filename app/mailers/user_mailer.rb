class UserMailer < ApplicationMailer
  default :from => 'noreply@fyiio.com'
  def company_invite(invite)
    @invite = invite

    mail(to: @invite.email, subject: 'Welcome to My Awesome Site')
  end
end