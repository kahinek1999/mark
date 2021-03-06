class RentalsController < ApplicationController
  before_action :find_rental, only: %i(show edit update)
  def show; end

  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      redirect_to rental_path(@rental)
    else
      render :new
    end
  end

  def edit; end

  def update
    @rental.update(rental_params)
    @rental.save
  end

  private

  def find_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:title, :address, :description, :price, :size, :city, :photo, :bed, :bath)
  end
end
