require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'relationships' do
    it { should belong_to :customer }
    it { should have_many :invoice_items }
    it { should have_many(:items).through(:invoice_items) }
    it { should have_many(:discounts).through(:invoice_items) }
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

    # invoice_items
    @invoiceitem1 = InvoiceItem.create!(item: @item1, invoice: @invoice1, quantity: 1, unit_price: @item1.unit_price,
                                        status: 0)
    @invoiceitem2 = InvoiceItem.create!(item: @item2, invoice: @invoice1, quantity: 2, unit_price: @item2.unit_price,
                                        status: 0)
    @invoiceitem3 = InvoiceItem.create!(item: @item1, invoice: @invoice2, quantity: 1, unit_price: @item1.unit_price,
                                        status: 0)
    @invoiceitem4 = InvoiceItem.create!(item: @item3, invoice: @invoice3, quantity: 1, unit_price: @item3.unit_price,
                                        status: 0)
    @invoiceitem5 = InvoiceItem.create!(item: @item3, invoice: @invoice1, quantity: 1, unit_price: @item1.unit_price,
                                        status: 0)
  end

  describe 'model methods' do
    describe '#formatted_date' do
      it "displays the date as 'Weekday, Month Day, Year'" do
        expect(@invoice1.formatted_date).to eq(@invoice1.created_at.strftime('%A, %B%e, %Y'))
      end
    end

    describe '#numerical_date' do
      it "displays the date as 'Weekday, Month Day, Year'" do
        expect(@invoice1.numerical_date).to eq(@invoice1.created_at.strftime('%-m/%-e/%y'))
      end
    end

    describe '#incomplete_invoices' do
      before(:each) do
        @customer_1 = Customer.create!(first_name: 'Luke', last_name: 'Harison')

        @merchant_1 = Merchant.create!(name: 'Target')
        @merchant_2 = Merchant.create!(name: 'Amazon')
        @merchant_3 = Merchant.create!(name: 'Fred Meyer')

        @invoice_4 = @customer_1.invoices.create!(status: 0)
        @invoice_5 = @customer_1.invoices.create!(status: 0)
        @invoice_6 = @customer_1.invoices.create!(status: 1)
        @invoice_7 = @customer_1.invoices.create!(status: 2)

        @item_1 = Item.create!(merchant_id: @merchant_1.id, name: 'Candy Dispenser', description: 'Dispenses Candy',
                               unit_price: 4291)
        @item_2 = Item.create!(merchant_id: @merchant_1.id, name: 'Towel', description: '100% Cotton', unit_price: 15)
        @item_3 = Item.create!(merchant_id: @merchant_2.id, name: 'Bowl', description: 'Ceramic, Blue', unit_price: 5)
        @item_4 = Item.create!(merchant_id: @merchant_2.id, name: 'Napkin Holder', description: 'Shaped Like A Taco',
                               unit_price: 45)
        @item_5 = Item.create!(merchant_id: @merchant_2.id, name: 'Rocket Ship', description: 'For Trip To Space',
                               unit_price: 10_000_000)
        @item_6 = Item.create!(merchant_id: @merchant_3.id, name: 'TV', description: '52 Inch Flat Screen',
                               unit_price: 90_999)

        @invoice_item_1 = InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice_4.id, quantity: 738,
                                              unit_price: 4291, status: 0)
        @invoice_item_2 = InvoiceItem.create!(item_id: @item_2.id, invoice_id: @invoice_4.id, quantity: 12,
                                              unit_price: 15, status: 2)
        @invoice_item_3 = InvoiceItem.create!(item_id: @item_3.id, invoice_id: @invoice_4.id, quantity: 554,
                                              unit_price: 5, status: 2)
        @invoice_item_4 = InvoiceItem.create!(item_id: @item_4.id, invoice_id: @invoice_5.id, quantity: 44_567,
                                              unit_price: 45, status: 2)
        @invoice_item_5 = InvoiceItem.create!(item_id: @item_5.id, invoice_id: @invoice_5.id, quantity: 1,
                                              unit_price: 10_000_000, status: 2)
        @invoice_item_6 = InvoiceItem.create!(item_id: @item_6.id, invoice_id: @invoice_6.id, quantity: 738,
                                              unit_price: 90_999, status: 2)
      end

      it "returns a list of all unique invoices that have items that have not been shipped from newest to oldest based on when
        the invoice was created " do
        expect(Invoice.incomplete_invoices).to eq([@invoice1, @invoice2, @invoice3, @invoice_4])
        expect(Invoice.incomplete_invoices).to_not include(@invoice_5, @invoice_6)
      end

      describe '#total_revenue' do
        it 'should return the toal revenue that will be generated by the specified invoice' do
          expect(@invoice_4.total_revenue).to eq(4311)
          expect(@invoice_5.total_revenue).to eq(10_000_045)
          expect(@invoice_6.total_revenue).to_not eq(4311)
        end
      end
    end

    describe '#discount' do
      it 'calculates the total discount of an invoice with a single invoice_item' do
        @merchant1.discounts.create!(threshold: 10, percentage: 20)
        @michael = Customer.create!(first_name: 'Michael', last_name: 'Marchand')
        @invoice_for_discount = @michael.invoices.create!(status: 2)
        @invoice_for_discount.invoice_items.create!(item: @item1, quantity: 10, unit_price: @item1.unit_price)

        expect(@invoice_for_discount.discount).to eq(4800)
      end

      it 'can apply separate discounts' do
        @marchand = Customer.create!(first_name: 'Marchand', last_name: 'Marchand')
        @merchant1.discounts.create!(threshold: 10, percentage: 20)
        @merchant1.discounts.create!(threshold: 15, percentage: 30)
        @invoice_with_two_discount_items = @marchand.invoices.create!(status: 2)
        @invoice_with_two_discount_items.invoice_items.create!(item: @item1, quantity: 12,
                                                               unit_price: @item1.unit_price)
        @invoice_with_two_discount_items.invoice_items.create!(item: @item2, quantity: 15,
                                                               unit_price: @item2.unit_price)
        expect(@invoice_with_two_discount_items.discount).to eq(12_510)
      end
    end

    describe '#items_available_for_discount' do
      it 'determines items available for discount' do
        @merchant1.discounts.create!(threshold: 10, percentage: 20)
        @michael = Customer.create!(first_name: 'Michael', last_name: 'Marchand')
        @invoice_for_discount = @michael.invoices.create!(status: 2)
        @invoice_for_discount.invoice_items.create!(item: @item1, quantity: 10, unit_price: @item1.unit_price)

        expect(@invoice_for_discount.items_available_for_discount.count).to eq(1)
        @invoice_for_discount.invoice_items.create!(item: @item2, quantity: 15,
                                                    unit_price: @item2.unit_price)
        expect(@invoice_for_discount.items_available_for_discount.count).to eq(2)
      end
    end
  end
end
