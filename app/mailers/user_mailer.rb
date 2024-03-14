class UserMailer < ApplicationMailer
  default from: ENV['MAILJET_DEFAULT_FROM']
  def order_confirmation(user)
    @user = User.find(user.user_id)
    mail(to: @user.email, subject: 'Order has been received')
  end
end
