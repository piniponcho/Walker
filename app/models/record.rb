class Record < ApplicationRecord
  belongs_to :route
  has_many :reservations, dependent: :destroy
  validates :available, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
