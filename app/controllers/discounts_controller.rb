class DiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
    # code to go here
  end

  def new
    merchant = Merchant.find(params[:merchant_id])
    @discount = merchant.discounts.new
  end


  def create

    merchant = Merchant.find(params[:merchant_id])
    @discount = merchant.discounts.new(discount_params)

  if @discount.save
    redirect_to merchant_discounts_path(params[:merchant_id])
   elsif
    render 'new'
   end
  end

  private

  def discount_params
    params.require(:discount).permit(:percentage, :threshold)
  end
end
