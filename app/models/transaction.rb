class Transaction < ApplicationRecord
  belongs_to :invoice
  
  has_many :discounts, through: :invoice
end