class Jackpot < ApplicationRecord
  enum :status, {
    waiting: "waiting",
    running: "running",
    finished: "finished",
    cancelled: "cancelled"
  }

  has_many :jackpot_entries, dependent: :destroy
  has_many :users, through: :jackpot_entries

  validates :status, presence: true
  validates :total_amount, presence: true, numericality: { greater_than: 0 }
  validates :draw_at, presence: true
  validate :draw_at_in_future

  private

  def draw_at_in_future
    if draw_at.present? && draw_at <= Time.current
      errors.add(:draw_at, "must be in the future")
    end
  end
end
