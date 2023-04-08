require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  before(:all) do
    @pokemon = build(:pokemon)
  end

  describe "validations" do
    it "is valid with all attributes" do
      expect(@pokemon).to be_valid
    end

    it "is not valid without a name" do
      @pokemon.name = nil
      expect(@pokemon).not_to be_valid
    end

    it "is not valid with a duplicate name" do
      FactoryBot.create(:pokemon, name: "Pikachu")
      @pokemon.name = "Pikachu"
      expect(@pokemon).not_to be_valid
    end

    it "is not valid without a type_1" do
      @pokemon.type_1 = nil
      expect(@pokemon).not_to be_valid
    end

    it "is not valid without a total" do
      @pokemon.total = nil
      expect(@pokemon).not_to be_valid
    end

    it "is not valid without an hp" do
      @pokemon.hp = nil
      expect(@pokemon).not_to be_valid
    end

    it "is not valid without an attack" do
      @pokemon.attack = nil
      expect(@pokemon).not_to be_valid
    end

    it "is not valid without a defense" do
      @pokemon.defense = nil
      expect(@pokemon).not_to be_valid
    end

    it "is not valid without a sp_atk" do
      @pokemon.sp_atk = nil
      expect(@pokemon).not_to be_valid
    end

    it "is not valid without a sp_def" do
      @pokemon.sp_def = nil
      expect(@pokemon).not_to be_valid
    end

    it "is not valid without a speed" do
      @pokemon.speed = nil
      expect(@pokemon).not_to be_valid
    end

    it "is not valid without a generation" do
      @pokemon.generation = nil
      expect(@pokemon).not_to be_valid
    end

    it "is not valid without a legendary status" do
      @pokemon.legendary = nil
      expect(@pokemon).not_to be_valid
    end

    it "is not valid with an invalid legendary status" do
      @pokemon.legendary = "invalid"
      expect(@pokemon).not_to be_valid
    end
  end
end
