require 'rails_helper'

RSpec.describe Discount do

  before(:each) do
    @merchant1 = Merchant.create!(name: 'Foo Merchant')
    @item1 = @merchant1.items.create!(name: 'Foo Item', price: 1000, description: 'foo description', status: 'enabled')
    @item2 = @merchant1.items.create!(name: 'Foo Item 2', price: 10000, description: 'foo description 2', status: 'enabled')
    @discount1 = @merchant1.discounts.create!(percentage: 20, threshold: 10)
    @customer1 = Customer.create!(first_name: 'Mr. Foo', last_name: 'Foo LastName')
    @invoice1 = @customer1.invoices.create!(status: 'completed')
    @transaction1 = @invoice1.transactions.create!(credit_card_number: 1, cc_expiration_date: nil, result: 'success')

    @invoice1.items << @item1
    @invoice1.items << @item2

  end

  describe 'relationships' do
    it { should belong_to :merchant }
    it { should have_many(:invoices).through(:merchant) }
    it { should have_many(:transactions).through(:invoices) }
    it { should have_many(:customers).through(:invoices) }
  end

  def discounted_revenue
    
  end

end