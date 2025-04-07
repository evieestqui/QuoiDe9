class AddUserInfoToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :first_name, :string
    add_column :bookings, :last_name, :string
    add_column :bookings, :email, :string
    add_column :bookings, :phone_number, :string
  end
end
