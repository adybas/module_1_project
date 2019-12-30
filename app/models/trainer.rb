class Trainer <ActiveRecord::Base
    has_many :pokemon
    has_many :types, through: :pokemon
end