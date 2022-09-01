class Reservation < ApplicationRecord
  belongs_to :record
  belongs_to :dog
  has_one :route, through: :record
  has_one :chatroom
end
