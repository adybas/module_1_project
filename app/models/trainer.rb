class Trainer <ActiveRecord::Base
    # has_many :trainer_pokemons
    has_many :pokemons #, through: :trainer_pokemons
    has_many :types, through: :pokemons
end