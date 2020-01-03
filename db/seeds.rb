require 'rest-client'
require 'json'
require 'pry'

Pokemon.destroy_all
Attack.destroy_all
PokemonAttack.destroy_all
Type.destroy_all

def get_pokemon_array
    all_pokemon = RestClient.get('https://pokeapi.co/api/v2/pokemon?limit=151')
    pokemon_hash = JSON.parse(all_pokemon)
    pokemon_hash["results"]
end
def get_pokemon
    get_pokemon_array.map do |pokemon|
        name = pokemon["name"]
        url = pokemon["url"]
        pokemon_url = RestClient.get(url)
        pokemon_url_hash = JSON.parse(pokemon_url)

        max_hp = pokemon_url_hash["base_experience"] * 2

        type = pokemon_url_hash["types"].map do |array|
            array["type"]["name"]
        end.first
        type_id = Type.find_or_create_by(element: type).id
        
        pokemon_id = Pokemon.find_or_create_by(name: name, type_id: type_id, max_hp: max_hp).id

        moves = pokemon_url_hash["moves"].map {|array| array["move"]}
        random_move_array = moves.sample(4)
        random_move_array.map do |move| 
            move_name = move["name"]
            move_url = move["url"]
                move_url_data = RestClient.get(move_url)
                move_url_hash = JSON.parse(move_url_data)
                move_power_dmg = move_url_hash["power"] 
            attack_id = Attack.find_or_create_by(move: move_name, move_damage: move_power_dmg).id
            PokemonAttack.find_or_create_by(pokemon_id: pokemon_id, attack_id: attack_id)
        end
    end
end
get_pokemon

#after everything is seeded, update Attack.all where move_dmg is NULL