class PlantsController < ApplicationController
    #GET/Plants
    def index
        plants = Plant.all
        render json:plants
    end
    #GET Plants /id
    def show
        plants=Plant.find_by(id: params[:id])
        if plants
            render json:plants
        else
            render json:{error :"Plant not found"}, status::not_found
        end
    end
    #Post/Plants
    def create
        #byebug
        plants = Plant.create(params)
        render json:plants, status::created
    end
    private
    def plants_params
        params.permit(:plant_id, :name, :price, :image)
    end

end
