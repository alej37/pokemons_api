require "csv"


Pokemon.delete_all
puts "Destroying all pokemon!"
sleep(2)
puts "Gotta catch em all!"
sleep(3)


filepath = './db/data/pokemon.csv'

CSV.foreach(filepath, headers: true, header_converters: :symbol) do |row|
  Pokemon.create!(
    name: row[:name],
    type_1: row[:type_1],
    type_2: row[:type_2],
    total: row[:total],
    hp: row[:hp],
    attack: row[:attack],
    defense: row[:defense],
    sp_atk: row[:sp_atk],
    sp_def: row[:sp_def],
    speed: row[:speed],
    generation: row[:generation],
    legendary: row[:legendary],
  )

end


puts "You've caught em all!!"
