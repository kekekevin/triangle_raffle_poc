class ElectronicRaffleOrderMailer < ActionMailer::Base
  
  default from: "triangle-raffle@gmail.com"
  
  def electronic_order_confirmation(order)
    @order = order
    mail(:subject => "Your Triangle Raffle Ticket Purchase", :to => order.email)
  end
  
end
