
class MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
    file = Rails.root.join('app', 'views', 'merchants', 'index.md')
    @markdown_copy = File.read(file)
  end

  def show
    @merchant = Merchant.find(params[:id])
  end
end
