class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :reserved_restaurants, through: :bookings, source: :restaurant

  enum mode: {
    normal: "restaurant",
    experience: "experience"
  }
end
