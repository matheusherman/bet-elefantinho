class JackpotEntry < ApplicationRecord
  belongs_to :jackpot
  belongs_to :user

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :number, presence: true, length: { is: 3 }
  validate :number_integer_only
  validates :jackpot_id, presence: true

  private
  
  def number_integer_only
    return if number.blank?

    unless number.is_a?(Array) && number.all? { |n| n.is_a?(Integer) }
      errors.add(:number, "must be an array of integers")
    end
  end

end

