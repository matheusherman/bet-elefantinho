class Jackpot < ApplicationRecord
  enum status: {
    waiting: 'waiting',
    runing: 'runing',
    finished: 'finished'
    cancelled: 'cancelled'
  }

  has_many :bets, dependent: :destroy
  has_many :users, through: :bets

  validates :status, presence: true
  validates :total_amount, presence: true
  validates :draw_at, presence: true
  validate :draw_at_in_future

  private

  def draw_at_in_future
    if draw_at.present? && draw_at <= Time.current
      errors.add(:draw_at, "must be in the future")
    end
  end

end
