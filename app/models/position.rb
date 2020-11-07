class Position < ApplicationRecord
    belongs_to :user, optional: true
    
    has_many :favorite_positions
    has_many :favorited_by, through: :favorite_positions, source: :user
    def self.search(search)
        if search && search != ""
           self.all.where("lower(description) LIKE :search", search: "%#{search}%")
        else  
            Position.all
        end
    end
end