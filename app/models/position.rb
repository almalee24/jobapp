class Position < ApplicationRecord
    belongs_to :user

    def self.search(search)
        if search 
            keyword = Position.find_by(title: search)
            if keyword
                self.where(user_id: keyword)
            else   
                Position.all
            end
        else  
            Position.all
        end
    end
end
