require 'rest-client'
require 'json'
require 'pry'

Pokemon.destroy_all

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
        type = pokemon_url_hash["types"].map do |array|
            array["type"]["name"]
        end.first
        max_hp = pokemon_url_hash["base_experience"] * 4

        first_move = pokemon_url_hash["moves"].first["move"]["name"]

# ===================
#         moves = pokemon_url_hash["moves"].map do |array|
#             array["move"]["name"]
#             array["move"]["url"]
#         end
# ===================

        type_id = Type.find_or_create_by(element: type).id
        attack_id = Attack.find_or_create_by(move: first_move, move_damage: 50).id
        Pokemon.find_or_create_by(name: name, type_id: type_id, attack_id: attack_id, max_hp: max_hp)
    end
end

get_pokemon