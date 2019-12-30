# require 'rest-client'
# require 'json'
 
# pokemon = RestClient.get('https://pokeapi.co/api/v2/pokemon?limit=151')

# puts JSON.parse(pokemon)

Pokemon.destroy_all
Trainer.destroy_all
Type.destroy_all
Attack.destroy_all

squirtle = Pokemon.find_or_create_by(name: "Squirtle", type_id: 1, move_id: 1, max_hp: 50)
shellder = Pokemon.find_or_create_by(name: "Shellder", type_id: 1, move_id: 2, max_hp: 70)
tentacruel = Pokemon.find_or_create_by(name: "Tentacruel", type_id: 1, move_id: 3, max_hp: 100)
froakie = Pokemon.find_or_create_by(name: "Froakie", type_id: 1, move_id: 4, max_hp: 50)

bulbasaur = Pokemon.find_or_create_by(name: "Bulbasaur", type_id: 2, move_id: 5, max_hp: 50)
snivy = Pokemon.find_or_create_by(name: "Snivy", type_id: 2, move_id: 6, max_hp: 70)
grookey = Pokemon.find_or_create_by(name: "Grookey", type_id: 2, move_id: 7, max_hp: 100)
meganium = Pokemon.find_or_create_by(name: "Meganium", type_id: 2, move_id: 8, max_hp: 105)

charmander = Pokemon.find_or_create_by(name: "Charmander", type_id: 3, move_id: 9, max_hp: 50)
magmar = Pokemon.find_or_create_by(name: "Magmar", type_id: 3, move_id: 10, max_hp: 70)
slugma = Pokemon.find_or_create_by(name: "Slugma", type_id: 3, move_id: 11, max_hp: 100)
ponyta = Pokemon.find_or_create_by(name: "Ponyta", type_id: 3, move_id: 12, max_hp: 50)

bubble = Attack.find_or_create_by(move: "Bubble", move_damage: 11)
water_gun = Attack.find_or_create_by(move: "Water Gun", move_damage: 13)
water_whip = Attack.find_or_create_by( move:"Water Whip", move_damage: 9)
scald = Attack.find_or_create_by( move: "Scald", move_damage: 10)
vine_whip = Attack.find_or_create_by(move: "Vine Whip", move_damage: 12)
leaf_tornado = Attack.find_or_create_by(move: "Leaf Tornado", move_damage: 10)
grass_knot = Attack.find_or_create_by(move: "Grass Knot", move_damage: 13)
petal_dance = Attack.find_or_create_by(move: "Petal Dance", move_damage: 8)
ember = Attack.find_or_create_by(move: "Ember", move_damage: 9)
flamethrower = Attack.find_or_create_by(move: "Flamethrower", move_damage: 12)
incenerate = Attack.find_or_create_by(move: "Incenerate", move_damage: 11)
fire_spin = Attack.find_or_create_by(move: "Fire Spin", move_damage: 10)