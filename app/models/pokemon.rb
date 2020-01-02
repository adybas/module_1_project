class Pokemon < ActiveRecord::Base
    belongs_to :attack
    belongs_to :trainer
    belongs_to :type
    
    
end