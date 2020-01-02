class Attack < ActiveRecord::Base
    has_many :pokemons, through: :pokemon_attacks
    has_many :types, through: :pokemon
end