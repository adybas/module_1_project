class Pokemon < ActiveRecord::Base
    has_many :attacks, through: :pokemon_attacks
    belongs_to :trainer
    belongs_to :type
    
    
end