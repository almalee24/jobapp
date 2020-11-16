class CompaniesController < ApplicationController
    before_action :set_company, only: [:show]
    def index
        if params[:company_id]
            set_position
            @companies = @position.companies
        else   
            @companies = Company.all
        end
    end

    def show
        if params[:position_id]
            set_position
        end
    end

    def new
        bindin.pry
        if params[:position_id]
            set_position
            @company = @position.companies.build
        else  
            @company = Company.new
        end
    end

    def create 
        if params[position_id]
            set_position
            @company = @position.companies.build(company_params)
        else   
            @company = Position.new(company_params)
        end
        if @company.save
            if @position
                redirect_to position_company_path(@position, @company)
            else   
                redirect_to @company
            end
        else   
            render :new
        end
    end

    private 
    def set_position 
        @position = Position.find_by_id(params[:sushi_id])
    end

    def set_company
        @company = Company.find_by_id(params[:id])
    end

    def company_params
        params.require(:company).permit(:name, :website, :location)
    end
end