class Review < ApplicationRecord
  belongs_to :user
  validates :rating, presence: true
  validates :comment, presence: true, length: { minimum: 10 }
end
