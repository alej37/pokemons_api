class AddColumnNameToPokemon < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :name, :string, null: false
  end
end
