class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :search]

  def index
    @restaurants = Restaurant.all
  end

  def search
    restaurants = Restaurant.all

    if params[:food_preferences].present?
      restaurants = restaurants.where("food_preferences @> ARRAY[?]::varchar[]", params[:food_preferences])
    end

    if params[:food_restrictions].present?
      restaurants = restaurants.where("food_restrictions @> ARRAY[?]::varchar[]", params[:food_restrictions])
    end

    if params[:address].present? && params[:walking_distance].present?
      # Convert walking time to meters (assuming average walking speed of 5km/h)
      # 5km/h = 83.33m/min
      walking_minutes = params[:walking_distance].first.to_i
      distance_in_meters = walking_minutes * 83.33

      # Filter restaurants within walking distance using Geocoder
      restaurants = restaurants.near(params[:address], distance_in_meters / 1000.0, units: :km)
    end

    # Using RANDOM() with a seed based on current timestamp to ensure different results
    @restaurant = restaurants.order(Arel.sql("RANDOM() * extract(epoch from now())::integer")).first

    if @restaurant
      redirect_to restaurant_path(@restaurant, food_preferences: params[:food_preferences], food_restrictions: params[:food_restrictions], address: params[:address], walking_distance: params[:walking_distance])
    else
      redirect_to restaurants_path, notice: "No matching restaurants found"
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])

    query = Restaurant.all.where.not(id: @restaurant.id)

    if params[:food_preferences].present?
      query = query.where("food_preferences @> ARRAY[?]::varchar[]", params[:food_preferences])
    end

    if params[:food_restrictions].present?
      query = query.where("food_restrictions @> ARRAY[?]::varchar[]", params[:food_restrictions])
    end

    @other_restaurants = query.order(Arel.sql("RANDOM() * extract(epoch from now())::integer")).first(3)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant successfully added!"
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :location, :rating, :description)
  end
end
