class PasswordResetMailer < ApplicationMailer
  default template_path: 'user_mailer'

  def reset_password_email(user)
    @user = user

      mail(to: @user.email, subject: 'Reset Your Password')

  end
end
