class BookingsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = @restaurant.bookings.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to dashboard_path, notice: "Booking successful!"
    else
      redirect_to restaurant_path(@restaurant), alert: "Booking failed."
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def booking_params
    params.require(:booking).permit(:date, :time, :number_of_people, :first_name, :last_name, :email, :phone_number)
  end
end
