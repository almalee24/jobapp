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
        @results = Position.search(params[:search_by_title])
    end

    def show
        @position = Position.find_by(id: params[:id])
    end

    def favorite 
        binding.pry
        type = params[:type]
        @position = Position.find_by(id: params[:id])
        if type == 'favorite'
            current_user.favorites << @position
            redirect_to position_path(@position), notice: "You favorited #{@position.title}"
        elsif type == "unfavorite"
            current_user.favorites.delete(@position)
            redirect_to position_path(@position), notice: "Unfavorited #{@position.title}"
        else   
            redirect_to position_path(@position), notice: "Nothing happened."
        end
    end

    private 
    def position_params
        params.require(:postion).permit(:title, :descritption, :company, :location, :url, :search_by_title)
    end
end