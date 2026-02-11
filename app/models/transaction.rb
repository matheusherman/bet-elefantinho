class Transaction < ApplicationRecord
  belongs_to :wallet

  validates :amount, numericality: { other_than: 0 }
  validates :transaction_type, presence: true
end
