class Position < ApplicationRecord
    belongs_to :user

    def self.search(search)
        binding.pry
        if search && search != ""
           self.all.where("lower(description) LIKE :search", search: "%#{search}%")
        else  
            Position.all
        end
    end
end