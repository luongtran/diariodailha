# encoding: utf-8
class DefaultMailer < ActionMailer::Base
  default from: "contato.diariodailha@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.default_mailer.alert_admin.subject
  #
  def alert_admin
    User.where(is_admin: true).each do |u|
      mail to: u.email, subject: "Cadastro de Fotógrafos"
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.default_mailer.finish_sale.subject
  #
  def finish_sale
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.default_mailer.alert_photographer.subject
  #
  def alert_photographer
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
