class Restaurant < ApplicationRecord
  belongs_to :restaurant_owner
  has_many :bookings, dependent: :destroy
  has_many :dishes, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true

  has_one_attached :photo
end
