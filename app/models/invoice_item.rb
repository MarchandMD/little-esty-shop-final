class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item
  has_one :merchant, through: :item
  has_many :discounts, through: :item

  enum status: [ :pending, :packaged, :shipped ]

  def item_name
    item.name
  end
end