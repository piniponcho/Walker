class Record < ApplicationRecord
  belongs_to :route
  has_many :reservations, dependent: :destroy
  validates :available, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :price, presence: true
  validates :available, presence: true, length: { minimum: 1 }
  validates :start_time, presence: true, comparison: { greater_than: DateTime.now }
  validates :end_time, presence: true, comparison: { greater_than: :start_time }

  def total_price
    duration_in_hours * price
  end

  private

  def duration_in_hours
    (end_time - start_time) / 60 / 60
  end

end
