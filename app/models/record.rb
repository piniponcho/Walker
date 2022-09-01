class Record < ApplicationRecord
  belongs_to :route
  has_many :reservations, dependent: :destroy
end
