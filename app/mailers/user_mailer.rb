class UserMailer < ApplicationMailer
  def order_confirmation(user, _order)
    @user = User.find(user.user_id)
    mail(to: @user.email, subject: 'Order has been received')
  end
end
