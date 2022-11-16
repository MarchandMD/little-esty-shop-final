class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item
  has_one :merchant, through: :item
  has_many :discounts, through: :merchant

  enum status: %i[pending packaged shipped]

  def item_name
    item.name
  end

    def discount_used
    discounts.where("#{quantity} >= discounts.threshold")
    .order(percentage: :desc)
    .first
  end
end
