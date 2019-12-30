class Type < ActiveRecord::Base
    belongs_to :pokemon
    has_many :attack, through: :pokemon
end