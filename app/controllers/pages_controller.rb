class PagesController < ApplicationController
  def home
    @restaurants = Restaurant.all
  end

  def dashboard
    @bookings = current_user.bookings if user_signed_in?
  end
end
