class Record < ApplicationRecord
  belongs_to :route
  has_many :reservations, dependent: :destroy
  validates :available, presence: true, length: { minimum: 1 }
  validates :start_time, presence: true, comparison: { greater_than: DateTime.now }
  validates :end_time, presence: true, comparison: { greater_than: :start_time }
end
