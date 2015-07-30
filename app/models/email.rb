require 'textveloper'

class Email < ActiveRecord::Base

  belongs_to :person

  after_save :send_sms

  private

  def send_sms
    sms = Textveloper::Sdk.new('f9fa1b6df916d41f5b15562c5268b150', '14b68970ad033bb11825de030afd32c4')
    mensaje = "Hola #{person.full_name}, se acaba de crear un correo. El correo es: #{self.email}."
    sms.send_sms(person.cellphone, mensaje)
  end
end