class ApartmentsController < ApplicationController
    
    #GET /apartments
    def index 
        render json: Apartment.all, status: :ok
    end

    #GET /apartments/:id
    def show
        apartment = find_apartment
        render json: apartment, status: :ok
    end

    #POST /apartments
    def create 
        apartment = Apartment.create(apartment_params)
        render json: apartment, status: :created
    end

    #PATCH /apartments/:id
    def update
        apartment = find_apartment
        Apartment.update(apartment_params)
        render json: apartment, status: :ok
    end

    #DELETE /apartments/:id
    def destroy 
        apartment = find_apartment
        apartment.destroy
        head :no_content
    end
    
    private

    def apartment_params
        params.permit(:number)
    end

    def find_apartment
        Apartment.find(params[:id])
    end

end


