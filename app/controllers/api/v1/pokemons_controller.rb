class Api::V1::PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
  rescue_from ActionController::ParameterMissing, with: :param_missing


  def index
    @pokemons = Pokemon.all
    render json: @pokemons
  end

  def show
    render json: @pokemon
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      render json: @pokemon, status: :created
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  def update
    if @pokemon.update(pokemon_params)
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @pokemon.destroy!
    head :no_content
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :type_1, :type_2, :total, :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, :legendary)
  end
  
  def not_found
    render json: { error: "Pokemon not found" }, status: :not_found
  end

  def not_destroyed
    render json: { error: "Pokemon could not be deleted" }, status: :unprocessable_entity
  end

  def param_missing
    render json: { error: "Required parameter missing" }, status: :bad_request
  end

end
