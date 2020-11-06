class PositionsController < ApplicationController
    # def home
    #    @positions = Position.all

    #    if params[:search_by_title] && params[:search_by_title] != ""
    #     @positions = @positions.where("title like ?", "%#{params[:search_by_title]}")
    #    end

    #    if params[:search_by_location] && params[:search_by_location] != ""
    #     @positions = @positions.where("location like ?", "%#{params[:search_by_location]}")
    #    end
    # end

    def index
        binding.pry
        @results = Position.search(params[:search_by_title])
    end

    private 
    def position_params
        params.require(:postion).permit(:title, :descritption, :company, :location, :url, :search_by_title)
    end
end