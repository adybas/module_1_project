class Trainer <ActiveRecord::Base
    has_many :pokemon
    has_many :type, through: :pokemon
end