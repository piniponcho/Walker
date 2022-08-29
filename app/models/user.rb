class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :dogs
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :routes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :dogs, dependent: :destroy
end
