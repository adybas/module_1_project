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
        Pokemon.create(name: name)
        
        url = pokemon["url"]
        pokemon_url = RestClient.get(url)
        pokemon_url_hash = JSON.parse(pokemon_url)
        types = pokemon_url_hash["types"].map do |array|
            array["type"]["name"]
        end
        max_ep = pokemon_url_hash["base_experience"] * 4
        
        moves = pokemon_url_hash["moves"].map do |array|
            array["move"]["name"]
            array["move"]["url"]
        end
    end
end

get_pokemon
