class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :discounts, through: :invoice_items
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items

  enum status: [:completed, :cancelled, 'in progress']

  def formatted_date
    created_at.strftime('%A, %B%e, %Y')
  end

  def numerical_date
    created_at.strftime('%-m/%-e/%y')
  end

  def self.incomplete_invoices
    joins(:invoice_items).where.not(invoice_items: { status: 2 }).distinct.order(:created_at)
  end

  def total_revenue
    items.sum('unit_price')
  end

  def discounted_revenue
    items.count
  end
end
