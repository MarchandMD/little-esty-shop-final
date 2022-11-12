require 'rails_helper'
require 'faker'

RSpec.describe 'discounts#show' do
  before :each do
    @merchant = create(:merchant)
    @item_1 = create(:item, merchant: @merchant)
    @item_2 = create(:item, merchant: @merchant)
    @item_3 = create(:item, merchant: @merchant)
    @customer1 = create(:customer)
    @customer2 = create(:customer)
    @customer3 = create(:customer)
    @customer1_invoice = create(:invoice, customer: @customer1)
    @customer2_invoice = create(:invoice, customer: @customer2)
    @customer3_invoice = create(:invoice, customer: @customer3)

    @customer1_invoice_item = create(:invoice_item, invoice: @customer1_invoice, item: @item_1, status: 0)
    @customer2_invoice_item = create(:invoice_item, invoice: @customer2_invoice, item: @item_2, status: 1)
    @customer3_invoice_item = create(:invoice_item, invoice: @customer3_invoice, item: @item_3, status: 2)

    @discount1 = Discount.create!(percentage: 20, threshold: 10, merchant_id: @merchant.id)
    Discount.create!(percentage: 30, threshold: 15, merchant_id: @merchant.id)

    visit "/merchants/#{@merchant.id}/discounts/#{@discount1.id}"
  end

  it 'displays the percentage and threshold' do
    expect(page).to have_content('Percentage')
    expect(page).to have_content(20)
    expect(page).to have_content('Quantity Threshold')
    expect(page).to have_content(10)
  end

end