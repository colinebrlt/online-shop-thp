class UserMailer < ApplicationMailer
  default from: 'team.genepi.thp@gmail.com'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  =  'https://cutekittens/users/sign_in'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def user_order(user, cart)
    @user = user 
    @cart = cart
    mail(to: @user.email, subject: 'Votre commande est bien enregistrée !') 
  end
end
