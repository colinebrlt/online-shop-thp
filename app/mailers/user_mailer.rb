class UserMailer < ApplicationMailer
  default from: 'team.genepi.thp@gmail.com'

  def user_order(user, cart)
    @user = user 
    @cart = cart
    mail(to: @user.email, subject: 'Votre commande est bien enregistrée !') 
  end
end
