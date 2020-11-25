class AdminMailer < ApplicationMailer
  #default from: 'team.genepi.thp@gmail.com'
 
  def order(order)
    @order = order
    @admin = 'team.genepi.thp@yopmail.com'

    mail(to: @admin, subject: `La commande #{@order.id} est passée !`) 
  end
end
