class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope :walkers, -> { where(walker_status: true) }
  has_many :routes, dependent: :destroy
  has_many :records, through: :routes
  has_many :reviews, dependent: :destroy
  has_many :dogs, dependent: :destroy
  has_many :reservations, through: :dogs
  has_many :messages, dependent: :destroy
  has_one_attached :photo
end
