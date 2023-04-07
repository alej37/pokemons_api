class ModifyLegendaryColumnInPokemons < ActiveRecord::Migration[7.0]
  def change
    change_column_null :pokemons, :legendary, false
  end
end
