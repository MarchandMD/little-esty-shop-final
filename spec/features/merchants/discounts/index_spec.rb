require 'rails_helper'
require 'faker'

RSpec.describe 'Merchant Discounts' do
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

    @discount1 = Discount.create!(percentage: 40, threshold: 10, merchant_id: @merchant.id)
    Discount.create!(percentage: 30, threshold: 15, merchant_id: @merchant.id)

    visit "/merchants/#{@merchant.id}/discounts"
  end
  describe 'as a Merchant' do
    describe '#index' do
      it "lists merchant's bulk discounts" do
        expect(page).to have_content('My Bulk Discounts')
        expect(page).to have_content('Percentage')
        expect(page).to have_content('Threshold')
        expect(page).to have_content(20)
        expect(page).to have_content(10)
        expect(page).to have_link('discount page'), "/merchants/#{@merchant.id}/discounts/#{@discount1.id}"
        expect(page).to have_content(30)
        expect(page).to have_content(15)
      end

      it 'has a link to create new discount' do
        expect(current_path).to eq(merchant_discounts_path(@merchant.id))
        expect(page).to have_link('create new discount')
        click_link('create new discount')
        expect(current_path).to eq(new_merchant_discount_path(@merchant.id))
        fill_in 'percentage', with: 50
        fill_in 'threshold', with: 40
        click_button('submit')
        expect(current_path).to eq(merchant_discounts_path(@merchant.id))
        expect(page).to have_content(50)
        expect(page).to have_content(40)
      end

      it 'has links to delete discounts' do
        expect(page).to have_content('delete discount')
        expect(page).to have_content(40)
        first(:link, 'delete discount').click
        expect(current_path).to eq(merchant_discounts_path(@merchant.id))
        expect(page).not_to have_content(40)
      end

      it 'displays upcoming holidays' do
        expect(page).to have_content('Upcoming Holidays')
      end
    end
  end
end
