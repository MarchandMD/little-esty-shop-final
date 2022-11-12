class Discount < ApplicationRecord
  belongs_to :merchant
  has_many :invoices, through: :merchant
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices
end