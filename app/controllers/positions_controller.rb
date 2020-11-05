class PositionsController < ApplicationController
    def index
       @positions = Position.all
    end

    def search
        
    end

    private 
    def position_params
        params.require(:postion).permit(:title, :descritption, :company, :location, :url)
    end
end