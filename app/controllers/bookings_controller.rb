class BookingsController < ApplicationController
  before_action :set_restaurant, only: [:create]

  def create
    @booking = @restaurant.bookings.new(user: current_user)

    if @booking.save
      redirect_to dashboard_path, notice: "Booking successful!"
    else
      redirect_to restaurant_path(@restaurant), alert: "Booking failed."
    end
  end

  def roulette
    # 確保有 food_preference 參數
    if params[:food_preference].present?
      # 找出符合標籤的餐廳
      filtered_restaurants = Restaurant.joins(:tags).where(tags: { name: params[:food_preference] }).distinct
      # 隨機選出 4 間餐廳
      @selected_restaurants = filtered_restaurants.sample(4)
    else
      @selected_restaurants = Restaurant.all.sample(4)
    end

    render json: @selected_restaurants
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
