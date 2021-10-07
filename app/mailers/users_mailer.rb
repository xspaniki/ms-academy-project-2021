class UsersMailer < ApplicationMailer
  def wakeup(user)
    @user = user
    mail(to: 'example@test.com', subject: 'Wake up...')
  end
end
