class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  def contact_form(contact)
    @contact = contact
    mail to: 'contact@covosoft.com', subject: "Polimeter Contact Form"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
    def password_reset(user)
      @user = user
        mail to: user.email, subject: "Password reset"
  end
end
