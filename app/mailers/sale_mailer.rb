# encoding: utf-8
class SaleMailer < ActionMailer::Base
  default from: "pagamento@diariodailha.com.br"



  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.default_mailer.finish_sale.subject
  #
  def finish_sale(sale)
    @sale = sale

    mail to: sale.user.email, subject: "Compra de fotos"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.default_mailer.alert_photographer.subject
  #
  def alert_photographer(photographer)
    @photographer = photographer

    mail to: photographer.email, subject: "Cadastro Efetuado"
  end

  def registration_aproved(photographer)
    mail to: photographer.email, subject: "Cadastro Aprovado"
  end
end
