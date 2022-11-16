require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe 'relationships' do
    it { should belong_to :invoice }
    it { should belong_to :item }
  end

  describe 'enums' do
    it { should define_enum_for(:status) }
  end

  before :each do
    # merchants
    @merchant1 = Merchant.create!(name: "Billy's Baby Book Barn")
    @merchant2 = Merchant.create!(name: "Candy's Child Compendium Collection")

    # items
    @item1 = @merchant1.items.create!(name: 'Learn to Count, Dummy!', description: "Educational Children's Book",
                                      unit_price: 2400)
    @item2 = @merchant1.items.create!(name: 'Go to Sleep Please, Mommy Just Wants to Watch Leno',
                                      description: 'Baby Book', unit_price: 1500)
    @item3 = @merchant2.items.create!(name: 'There ARE More Than Seven Animals But This is a Good Start',
                                      description: "Educational Children's Book", unit_price: 2100)

    # customers
    @mary = Customer.create!(first_name: 'Mary', last_name: 'Mommy')
    @daniel = Customer.create!(first_name: 'Daniel', last_name: 'Daddy')
    @annie = Customer.create!(first_name: 'Annie', last_name: 'Auntie')

    # invoices
    @invoice1 = @mary.invoices.create!(status: 2)
    @invoice2 = @daniel.invoices.create!(status: 2)
    @invoice3 = @annie.invoices.create!(status: 2)

    # invoice Items
    @invoiceitem1 = @invoice1.invoice_items.create!(item: @item1, invoice: @invoice1, quantity: 15,
                                                    unit_price: @item1.unit_price, status: 0)
    @invoiceitem2 = @invoice1.invoice_items.create!(item: @item2, invoice: @invoice1, quantity: 10,
                                                    unit_price: @item2.unit_price, status: 0)
    @invoiceitem3 = InvoiceItem.create!(item: @item1, invoice: @invoice2, quantity: 1, unit_price: @item1.unit_price,
                                        status: 0)
    @invoiceitem4 = InvoiceItem.create!(item: @item3, invoice: @invoice3, quantity: 1, unit_price: @item3.unit_price,
                                        status: 0)
  end

  describe 'instance methods' do
    describe '#item_name' do
      it 'returns the name of an invoice_item item' do
        expect(@invoiceitem1.item_name).to eq(@item1.name)
        expect(@invoiceitem2.item_name).to eq(@item2.name)
        expect(@invoiceitem3.item_name).to eq(@item1.name)
      end
    end

    describe '#discount_used' do
      it 'can access the discount applied threshold amount' do
        @merchant1.discounts.create!(threshold: 10, percentage: 20)
        @merchant1.discounts.create!(threshold: 15, percentage: 30)

        expect(@invoiceitem1.discount_used.threshold).to eq(15)
        expect(@invoiceitem2.discount_used.threshold).to eq(10)
      end
    end
  end
end
