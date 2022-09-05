class Route < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :records, dependent: :destroy
  has_many :reservations, through: :records
  has_one_attached :photo
  validates :name, presence: true
  validates :address, presence: true
  validates :photo, presence: true
  include PgSearch::Model
  pg_search_scope :search_by_address,
                  against: [:address],
                  using: {
                    tsearch: { prefix: true }
                  }
end
