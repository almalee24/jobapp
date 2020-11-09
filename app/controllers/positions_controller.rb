class PositionsController < ApplicationController
    before_action :set_position, only: [:show, :edit, :update, :destroy]
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
        if !@position
            redirect_to positions_path
        end
    end

    def new 
        @position = Position.new
    end

    def create 
        @position = Position.new(position_params)
        @position.user_id = current_user.id if current_user
        if @position.save
            redirect_to @position 
        else  
            render :new
        end
    end

    def edit
        if !@position
            redirect_to positions_path
        end
    end

    def update
        if @position
            @position.update(position_params)
            if @position.errors.any?
                render "edit"
            else    
                redirect_to @position
            end
        else   
            render 'edit'
        end
    end

    def destroy 
        @position.destroy 
        redirect_to positions_path
    end

    def favorite 
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
    def set_position
        @position = Position.find_by_id(params[:id])
    end

    def position_params
        params.require(:position).permit(:title, :description, :company, :location, :url, :jobtype)
    end
end