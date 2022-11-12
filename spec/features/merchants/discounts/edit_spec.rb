require 'rails_helper'
require 'faker'

RSpec.describe 'discounts#edit' do
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

  it 'has a link on the show page' do
    expect(page).to have_content('edit discount')
  end

  it 'has the ability to edit the discount' do
    click_link('edit discount')
    expect(current_path).to eq(edit_merchant_discount_path(@merchant.id, @discount1.id))
    fill_in "percentage", with: 89
    fill_in "threshold", with: 50
    click_button 'submit'
    expect(current_path).to eq(merchant_discount_path(@merchant.id, @discount1.id))
    expect(page).to have_content(89)
    expect(page).to have_content(50)
  end


end