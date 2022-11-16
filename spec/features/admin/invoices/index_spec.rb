require "rails_helper"

RSpec.describe "Admin Invoices Index Page", type: :feature do

  before(:each) do
    @merchant_1 = Merchant.create!(name: "Target", status: 1)
    @merchant_2 = Merchant.create!(name: "Amazon", status: 1)
    @merchant_3 = Merchant.create!(name: "Fred Meyer", status: 0)

    @customer_1 = Customer.create!(first_name: "Luke", last_name: "Harison")
    @customer_2 = Customer.create!(first_name: "Angela", last_name: "Leizer")
    @customer_3 = Customer.create!(first_name: "Matt", last_name: "Sorry")
    @customer_4 = Customer.create!(first_name: "Drake",last_name: "Pointer")
    @customer_5 = Customer.create!(first_name: "Fannie", last_name: "May")
    @customer_6 = Customer.create!(first_name: "Lorelai", last_name: "Gillmore")
    @customer_7 = Customer.create!(first_name: "Simon", last_name: "Garfunkle")

    @invoice_1 = @customer_1.invoices.create!(status: 0)
    @invoice_2 = @customer_1.invoices.create!(status: 0)
    @invoice_3 = @customer_1.invoices.create!(status: 1)
    @invoice_4 = @customer_1.invoices.create!(status: 2)
    @invoice_5 = @customer_1.invoices.create!(status: 2)
    @invoice_6 = @customer_2.invoices.create!(status: 0)
    @invoice_7 = @customer_2.invoices.create!(status: 0)
    @invoice_8 = @customer_3.invoices.create!(status: 0)
    @invoice_9 = @customer_3.invoices.create!(status: 0)
    @invoice_10 = @customer_3.invoices.create!(status: 2)
    @invoice_11 = @customer_3.invoices.create!(status: 0)
    @invoice_12 = @customer_4.invoices.create!(status: 1)
    @invoice_13 = @customer_4.invoices.create!(status: 1)
    @invoice_14 = @customer_4.invoices.create!(status: 2)
    @invoice_15 = @customer_5.invoices.create!(status: 0)
    @invoice_16 = @customer_5.invoices.create!(status: 0)
    @invoice_17 = @customer_6.invoices.create!(status: 1)
    @invoice_18 = @customer_6.invoices.create!(status: 2)
    @invoice_19 = @customer_6.invoices.create!(status: 2)
    @invoice_20 = @customer_7.invoices.create!(status: 0)

    @item_1 = Item.create!(merchant_id: @merchant_1.id, name: "Candy Dispenser", description: "Dispenses Candy", unit_price: 4291)
    @item_2 = Item.create!(merchant_id: @merchant_1.id, name: "Towel", description: "100% Cotton", unit_price: 15)
    @item_3 = Item.create!(merchant_id: @merchant_2.id, name: "Bowl", description: "Ceramic, Blue", unit_price: 5)
    @item_4 = Item.create!(merchant_id: @merchant_2.id, name: "Napkin Holder", description: "Shaped Like A Taco", unit_price: 45)
    @item_5 = Item.create!(merchant_id: @merchant_2.id, name: "Rocket Ship", description: "For Trip To Space", unit_price: 10000000)
    @item_6 = Item.create!(merchant_id: @merchant_3.id, name: "TV", description: "52 Inch Flat Screen", unit_price: 90999)

    @invoice_item_1 = InvoiceItem.create!(item_id: @item_1.id, invoice_id: @invoice_1.id, quantity: 738, unit_price: 4291, status: 0)
    @invoice_item_2 = InvoiceItem.create!(item_id: @item_2.id, invoice_id: @invoice_1.id, quantity: 12, unit_price: 15, status: 1)
    @invoice_item_3 = InvoiceItem.create!(item_id: @item_3.id, invoice_id: @invoice_1.id, quantity: 554, unit_price: 5, status: 2)
    @invoice_item_4 = InvoiceItem.create!(item_id: @item_4.id, invoice_id: @invoice_2.id, quantity: 44567, unit_price: 45, status: 1)
    @invoice_item_5 = InvoiceItem.create!(item_id: @item_5.id, invoice_id: @invoice_2.id, quantity: 1, unit_price: 10000000, status: 2)
    @invoice_item_6 = InvoiceItem.create!(item_id: @item_6.id, invoice_id: @invoice_3.id, quantity: 738, unit_price: 90999, status: 2)

    @transaction_1 = @invoice_1.transactions.create!(credit_card_number: 4654405418249632, result: "success")
    @transaction_2 = @invoice_2.transactions.create!(credit_card_number: 4580251236515201, result: "success")
    @transaction_3 = @invoice_3.transactions.create!(credit_card_number: 4354495077693036, result: "failed")
    @transaction_4 = @invoice_4.transactions.create!(credit_card_number: 4515551623735607, result: "failed")
    @transaction_5 = @invoice_5.transactions.create!(credit_card_number: 4844518708741275, result: "failed")
    @transaction_6 = @invoice_6.transactions.create!(credit_card_number: 4203696133194408, result: "success")
    @transaction_7 = @invoice_7.transactions.create!(credit_card_number: 4801647818676136, result: "success")
    @transaction_8 = @invoice_8.transactions.create!(credit_card_number: 4540842003561938, result: "success")
    @transaction_9 = @invoice_9.transactions.create!(credit_card_number: 4140149827486249, result: "success")
    @transaction_10 = @invoice_10.transactions.create!(credit_card_number: 4923661117104166, result: "failed")
    @transaction_11 = @invoice_11.transactions.create!(credit_card_number: 4800749911485986, result: "success")
    @transaction_12 = @invoice_12.transactions.create!(credit_card_number: 4017503416578382, result: "failed")
    @transaction_13 = @invoice_13.transactions.create!(credit_card_number: 4536896898764278, result: "failed")
    @transaction_14 = @invoice_14.transactions.create!(credit_card_number: 4411510861233607, result: "failed")
    @transaction_15 = @invoice_15.transactions.create!(credit_card_number: 4869639160798434, result: "success")
    @transaction_16 = @invoice_16.transactions.create!(credit_card_number: 4738848761455352, result: "success")
    @transaction_17 = @invoice_17.transactions.create!(credit_card_number: 4214497729954420, result: "failed")
    @transaction_18 = @invoice_18.transactions.create!(credit_card_number: 4436110257010678, result: "failed")
    @transaction_19 = @invoice_19.transactions.create!(credit_card_number: 4332881798016631, result: "failed")
    @transaction_20 = @invoice_20.transactions.create!(credit_card_number: 4886443388914010, result: "success")
  end

  it "the page contains a list of all invoice id's in the system" do
    visit "admin/invoices"

    within("#admin-invoices") do
      expect(page).to have_content(@invoice_1.id)
      expect(page).to have_content(@invoice_1.id)
      expect(page).to have_content(@invoice_2.id)
      expect(page).to have_content(@invoice_3.id)
      expect(page).to have_content(@invoice_4.id)
      expect(page).to have_content(@invoice_5.id)
      expect(page).to have_content(@invoice_6.id)
      expect(page).to have_content(@invoice_7.id)
      expect(page).to have_content(@invoice_8.id)
      expect(page).to have_content(@invoice_10.id)
      expect(page).to have_content(@invoice_11.id)
      expect(page).to have_content(@invoice_12.id)
      expect(page).to have_content(@invoice_13.id)
      expect(page).to have_content(@invoice_14.id)
      expect(page).to have_content(@invoice_15.id)
      expect(page).to have_content(@invoice_16.id)
      expect(page).to have_content(@invoice_17.id)
      expect(page).to have_content(@invoice_18.id)
      expect(page).to have_content(@invoice_19.id)
      expect(page).to have_content(@invoice_20.id)
    end
  end

  it "each invoice id links to that invoices admin invoice show page" do
    visit "admin/invoices"
    within("#admin-invoices") do
      expect(page).to have_link("#{@invoice_1.id}")
      click_link "#{@invoice_1.id}"
    end
    expect(current_path).to eq(admin_invoice_path(@invoice_1.id))

    visit "admin/invoices"
    within("#admin-invoices") do
      expect(page).to have_link("#{@invoice_3.id}")
      click_link "#{@invoice_3.id}"
    end
    expect(current_path).to eq(admin_invoice_path(@invoice_3.id))
  end
end