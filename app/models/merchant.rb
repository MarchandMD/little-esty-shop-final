class Merchant < ApplicationRecord
  has_many :items
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  validates_presence_of :name

  enum status: {
    disabled: 0,
    enabled: 1
  }

  def unique_invoices
    invoices.distinct
  end

  def items_for_this_invoice(invoice_id)
    invoice_items.where(invoice_id: invoice_id)
  end

  def invoice_revenue(invoice_id)
    items_for_this_invoice(invoice_id).sum('invoice_items.unit_price * invoice_items.quantity')
  end

  def invoices_not_shipped
    invoice_items.where(status: %w[0 1])
  end
  
  def merchant_top_5_customers
    Customer.select(:id, :first_name, :last_name, 'count(transactions.*) as number_transactions').joins(invoices: [:items, :transactions]).where(['items.merchant_id = ? and transactions.result = ?', self.id, 'success']).group(:id).order('number_transactions desc').limit(5)
  end

  def five_most_popular_items_by_revenue
    items.select('distinct items.name as item_name, items.id as item_id, invoice_items.unit_price * invoice_items.quantity as total_revenue')
         .joins(invoices: :transactions)
         .where('result = ?', 'success')
         .order('total_revenue desc')
         .limit(5)
  end

  def best_day(item_id)
    invoices.select('invoices.created_at, items.name as item_name')
    .joins(:invoice_items)
    .joins(:items)
    .where('items.id = ?', item_id)
    .order('invoices.created_at desc')
    .limit(1)
  end
end

1
