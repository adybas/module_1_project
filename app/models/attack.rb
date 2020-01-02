class Attack < ActiveRecord::Base
    has_many :pokemons
    has_many :types, through: :pokemons
end