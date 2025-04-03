class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def search
    query = Restaurant.all

    if params[:food_preferences].present?
      query = query.where("food_preferences @> ARRAY[?]::varchar[]", params[:food_preferences])
    end

    if params[:food_restrictions].present?
      query = query.where("food_restrictions @> ARRAY[?]::varchar[]", params[:food_restrictions])
    end

    # Using RANDOM() with a seed based on current timestamp to ensure different results
    @restaurant = query.order(Arel.sql("RANDOM() * extract(epoch from now())::integer")).first

    if @restaurant
      redirect_to restaurant_path(@restaurant, food_preferences: params[:food_preferences], food_restrictions: params[:food_restrictions])
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

  def random
    cuisine = params[:cuisine]
    @restaurant = Restaurant.where("? = ANY (categories)", cuisine)
                           .order("RANDOM()")
                           .first

    respond_to do |format|
      format.json { render json: { id: @restaurant.id } }
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :location, :rating, :description)
  end
end
