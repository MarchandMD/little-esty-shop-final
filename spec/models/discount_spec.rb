require 'rails_helper'

RSpec.describe Discount do
  describe 'relationships' do
    it { should belong_to :merchant }
    it { should have_many(:invoices).through(:merchant) }
    it { should have_many(:transactions).through(:invoices) }
    it { should have_many(:customers).through(:invoices) }
  end

end