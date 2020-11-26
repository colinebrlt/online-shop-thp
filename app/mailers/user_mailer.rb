class UserMailer < ApplicationMailer
  default from: 'team.genepi.thp@gmail.com'

  def user_order(order)
    @order = order
    mail(to: @order.user.email, subject: 'Votre commande est bien enregistrée !') 
  end
end
