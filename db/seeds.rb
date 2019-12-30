# require 'rest-client'
# require 'json'
 
# pokemon = RestClient.get('https://pokeapi.co/api/v2/pokemon?limit=151')

# puts JSON.parse(pokemon)

Pokemon.destroy_all
Trainer.destroy_all
Type.destroy_all

squirtle = Pokemon.find_or_create_by(name: "Squirtle", type_id: 1, move: "Bubble", max_hp: 50)
shelldar = Pokemon.find_or_create_by(name: "Shelldar", type_id: 1, move: "Water Gun", max_hp: 70)
tentacruel = Pokemon.find_or_create_by(name: "Tentacruel", type_id: 1, move: "Whip", max_hp: 100)
froakie = Pokemon.find_or_create_by(name: "Froakie", type_id: 1, move: "Scald", max_hp: 50)

bulbasaur = Pokemon.find_or_create_by(name: "Bulbasaur", type_id: 2, move: "Wine Whip", max_hp: 50)
snivy = Pokemon.find_or_create_by(name: "Snivy", type_id: 2, move: "Leaf Tornado", max_hp: 70)
grookey = Pokemon.find_or_create_by(name: "Grookey", type_id: 2, move: "Grass Knot", max_hp: 100)
meganium = Pokemon.find_or_create_by(name: "Meganium", type_id: 2, move: "Petal Dance", max_hp: 105)

charmander = Pokemon.find_or_create_by(name: "Charmander", type_id: 3, move: "Ember", max_hp: 50)
magmar = Pokemon.find_or_create_by(name: "Magmar", type_id: 3, move: "Flame Thrower", max_hp: 70)
slugma = Pokemon.find_or_create_by(name: "Slugma", type_id: 3, move: "Incinerate", max_hp: 100)
ponyta = Pokemon.find_or_create_by(name: "Ponyta", type_id: 3, move: "Fire-Spin", max_hp: 50)