class Attack < ActiveRecord::Base
    belongs_to :pokemon
    has_many :types, through: :pokemon
end