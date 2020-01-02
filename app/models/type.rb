class Type < ActiveRecord::Base
    belongs_to :pokemon
    has_many :attacks, through: :pokemons
end