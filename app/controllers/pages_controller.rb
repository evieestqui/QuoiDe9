class PagesController < ApplicationController
  def home
    @restaurants = Restaurant.all
  end

  def dashboard
    @future_bookings = current_user.bookings.where("date >= ?", Date.today).order(created_at: :desc)
    @past_bookings = current_user.bookings.where("date < ?", Date.today).order(created_at: :desc)
  end
end
