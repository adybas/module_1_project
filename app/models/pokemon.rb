class Pokemon < ActiveRecord::Base
    belongs_to :trainer
    belongs_to :type
    belongs_to :attack
end