class Dog < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true
  validates :breed, presence: true
  validates :birthday, presence: true, comparison: { greater_than: DateTime.now }
  validates :size, presence: true
  validates :weight, presence: true, length: { in: 1..100 }
end
