class Admin::InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
    @merchant = Merchant.find(@invoice.merchants.first.id)
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update(invoice_params)
    redirect_to admin_invoice_path(@invoice.id)
  end

    private
  def invoice_params
    params.permit(:customer_id, :status)
  end

end