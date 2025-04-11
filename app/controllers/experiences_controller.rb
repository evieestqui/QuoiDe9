class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def index
    @experiences = Experience.all
  end

  def search
    experiences = Experience.all

    if params[:experience_category].present?
      experiences = experiences.where("categories @> ARRAY[?]::varchar[]", params[:experience_category])
    end

    if params[:address].present?
      experiences = experiences.near(params[:address], 10, units: :km)
    end

    # Using RANDOM() with a seed based on current timestamp to ensure different results
    @experience = experiences.order(Arel.sql("RANDOM() * extract(epoch from now())::integer")).first

    if @experience
      redirect_to experience_path(@experience, experience_category: params[:experience_category], address: params[:address], walking_distance: params[:walking_distance])
    else
      redirect_to experiences_path, notice: "No matching experiences found"
    end
  end

  def show
    @experience = Experience.find(params[:id])

    query = Experience.all.where.not(id: @experience.id)

    if params[:experience_category].present?
      query = query.where("categories @> ARRAY[?]::varchar[]", params[:experience_category])
    end

    @other_experiences = query.order(Arel.sql("RANDOM() * extract(epoch from now())::integer")).first(3)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @experience = Experience.new(experience_params)
    if @experience.save
      redirect_to @experience, notice: "Experience successfully added!"
    else
      render :new
    end
  end

  private

  def experience_params
    params.require(:experience).permit(:name, :address, :latitude, :longitude, :price, :category, :image_url)
  end
end
