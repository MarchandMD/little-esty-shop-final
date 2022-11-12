class DiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])

    @discount = @merchant.discounts.find(params[:id])
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
    else
      render 'new'
    end
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
    @discount = @merchant.discounts.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:merchant_id])
    @discount = @merchant.discounts.find(params[:id])

    if @discount.update(discount_params)
      redirect_to merchant_discount_path(@merchant.id)
    else
      render 'edit'
    end
  end

  def destroy
    merchant = Merchant.find(params[:merchant_id])
    merchant.discounts.destroy(params[:id])
    redirect_to merchant_discounts_path(merchant.id)
  end

  private

  def discount_params
    params.require(:discount).permit(:percentage, :threshold)
  end
end
