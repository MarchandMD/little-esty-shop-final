class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.integer :percentage
      t.integer :threshold
      t.integer :merchant_id, foreign_key: true

      t.timestamps
    end
  end
end
