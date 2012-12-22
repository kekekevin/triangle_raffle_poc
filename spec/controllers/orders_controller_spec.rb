require 'spec_helper'

describe OrdersController do

  describe "index" do
    it "returns all electronic raffle orders" do
      ElectronicRaffleOrder.stub(:all).and_return([])
      get :index
      assigns(:electronic_raffle_orders).should_not be_nil
      response.should render_template "index"
    end
  end

end
