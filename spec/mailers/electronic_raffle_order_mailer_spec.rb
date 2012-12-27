require "spec_helper"

describe ElectronicRaffleOrderMailer do
  
  let(:order) { FactoryGirl.build(:electronic_raffle_order) }
  let(:mail) { ElectronicRaffleOrderMailer.electronic_order_confirmation(order) }
  
  it 'should send an email to the email address specified' do
    mail.to.should == [order.email]
  end
  
  it 'should have the proper from address' do
    mail.from.should == ["triangle-raffle@gmail.com"]
  end
  
  it 'should send the proper subject' do
    mail.subject.should == "Your Triangle Raffle Ticket Purchase"
  end
  
  it 'should contain who made the order' do
    mail.body.encoded.should match(order.first_name)
    mail.body.encoded.should match(order.last_name)
  end
  
  it 'should contain the number of tickets purchased' do
    mail.body.encoded.should match("Purchase Quantity:")
    mail.body.encoded.should match("#{order.quantity}")
  end
  
  it 'should contain the total' do
    order.total = BigDecimal("50.00")
    mail.body.encoded.should match("Total:")
    mail.body.encoded.should match(/\$50\.00/)
  end
end
