class UsersMailer < ApplicationMailer
  def wakeup(user)
    send_email(user, 'Wake up bro...')
  end

  def invite(user)
    send_email(user, 'Invite to application...')
  end

  private

  def send_email(user, subject)
    @user = user
    mail(to: user.email, subject: subject)
  end
end
