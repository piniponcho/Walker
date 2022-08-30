class Route < ApplicationRecord
  belongs_to :user
  has_many :records
  has_many :reservations, through: :records
end
