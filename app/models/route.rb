class Route < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :records
  has_many :reservations, through: :records
  include PgSearch::Model
  pg_search_scope :search_by_address,
                  against: [:address],
                  using: {
                    tsearch: { prefix: true }
                  }
end
