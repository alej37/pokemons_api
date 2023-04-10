class Api::V1::PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::ParameterMissing, with: :param_missing

  def index
    @pokemons = Pokemon.page(params[:page]).per(10)
    render json: @pokemons.as_json
  end

  def show
    render json: @pokemon.as_json
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      render json: @pokemon.as_json, status: :created
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  def update
    if @pokemon.update(pokemon_params)
      render json: @pokemon.as_json
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @pokemon.destroy
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

  def param_missing(e)
    render json: { error: "Required parameter missing: #{e.param}" }, status: :bad_request
  end
end
