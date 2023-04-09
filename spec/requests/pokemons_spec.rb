require 'rails_helper'

describe "Pokemons Api v1", type: :request do
  before do
    Pokemon.destroy_all
    FactoryBot.create_list(:pokemon, 15)
    @pokemon = Pokemon.all.sample
  end

  describe "GET #Index" do
    it 'gets all pokemons' do
      get api_v1_pokemons_url
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(15)  
    end
  end

  describe "GET #Show" do
    it "gets requested pokemon" do
      get api_v1_pokemon_url(@pokemon)
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['id']).to eq(@pokemon.id)    
    end
    
    it "returns 404 if pokemon not found" do
      get api_v1_pokemon_url(999)
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['error']).to eq("Pokemon not found")    
    end
  end

  describe "POST #Create" do
    it "creates a new pokemon" do
      expect {
        post api_v1_pokemons_url, params: { pokemon: FactoryBot.attributes_for(:pokemon) }
      }.to change(Pokemon, :count).by(1)
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq(Pokemon.last.as_json)
    end

    it "returns 422 if pokemon not created" do
      expect {
        post api_v1_pokemons_url, params: { pokemon: FactoryBot.attributes_for(:pokemon, name: nil) }
      }.to change(Pokemon, :count).by(0)
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['name']).to include("can't be blank")
    end
  end
  
  describe "PUT #Update" do
    it "updates a pokemon" do
      put api_v1_pokemon_url(@pokemon), params: { pokemon: { name: "New Name" } }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['name']).to eq("New Name")
    end

    it "returns 422 if pokemon not updated" do
      put api_v1_pokemon_url(@pokemon), params: { pokemon: { name: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['name']).to include("can't be blank")
    end
  end
  
  describe "DELETE #Destroy" do
    it "deletes a pokemon" do
      expect {
        delete api_v1_pokemon_url(@pokemon)
      }.to change(Pokemon, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end

  describe "Error Handling" do
    it "returns 400 if required parameter missing" do
      post api_v1_pokemons_url, params: { pokemon: { } }
      expect(response).to have_http_status(:bad_request)
      p JSON.parse(response.body)
      expect(JSON.parse(response.body)['error']).to eq("Required parameter missing")
    end
  end
  
end
