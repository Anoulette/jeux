class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # afficher toutes les réservations d'un user selon son id
  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @game = Game.find(params[:game_id])
    @booking = Booking.new
  end

  # créer une nouvelle réservation pour un user selon son id
  def create
  # trouver le jeu correspondant selon son id
    @game = Game.find(params[:game_id])
  # créer la réservation
    @booking = Booking.new(booking_params)
    @booking.game = @game
    @booking.user = current_user
    if @booking.save!
      redirect_to game_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  #  afficher le détail de la réservation d'un jeu
  def show
    @booking = Booking.find(params[:id])
  end

  # modifier la réservation d'un jeu
  def edit
    @booking = Booking.find(params[:id])
  end

  # enregistrer la modif du jeu
  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    @game = Game.find(params[:game_id])
    redirect_to game_bookings_path(@game)
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :accepted, :comment)
  end
end
