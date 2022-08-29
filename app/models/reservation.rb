class Reservation < ApplicationRecord
  belongs_to :record
  belongs_to :dog
end
