class AdminMailer < ApplicationMailer
  # default from: 'team.genepi.thp@gmail.com'
 
  def order(user, cart)
    @user = user 
    @cart = cart
    @admin = 'team.genepi.thp@gmail.com'

    mail(to: @admin, subject: `La commande #{@cart.id} est passée !`) 
  end
end
