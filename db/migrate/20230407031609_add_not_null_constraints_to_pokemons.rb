class AddNotNullConstraintsToPokemons < ActiveRecord::Migration[7.0]
  def change
    change_column_null :pokemons, :type_1, false
    change_column_null :pokemons, :total, false
    change_column_null :pokemons, :hp, false
    change_column_null :pokemons, :attack, false
    change_column_null :pokemons, :defense, false
    change_column_null :pokemons, :sp_atk, false
    change_column_null :pokemons, :sp_def, false
    change_column_null :pokemons, :speed, false
    change_column_null :pokemons, :generation, false
  end
end
