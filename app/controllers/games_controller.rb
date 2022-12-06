class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # pour tous : afficher tous les jeux
  def index
    @games = Game.all
  end

  # si logué : on peut créer 1 nouveau jeu : new (dder le formulaire) + create 'enregistrer dans le formulaire)
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save!
      redirect_to games_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  #  pour tous : afficher 1 jeu
  def show
    @game = Game.find(params[:id])
  end

  # seul le owner du jeu peut demander le formulaire de modif
  def edit
    @game = Game.find(params[:id])
  end

  # seul le owner du jeu peut enregistrer la modif du jeu
  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

  private

  def game_params
    params.require(:game).permit(:title, :price_per_day, :street_number, :street, :zip_code, :city, :description)
  end
end
