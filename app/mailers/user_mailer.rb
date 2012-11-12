# encoding: utf-8
class UserMailer < Devise::Mailer
  helper :application
  default from: "contato.diariodailha@gmail.com"

  def confirmation_instructions(record)
    @resource = record
    mail to: record.email, subject: "Cadastro no Diário da ilha"
  end

  def reset_password_instructions(record)
    @resource = record
    mail to: record.email, subject: "Alterar senha"
    
  end
end
