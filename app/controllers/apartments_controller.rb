class ApartmentsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :error_not_found

    def index
        apartments = Apartment.all
        render json: apartments, status: :ok
    end

    def show
        apartment = Apartment.find(params[:id])
        render json: apartment, status: :ok
    end

    def create
        apartment = Apartment.create!(number: params[:number])
        render json: apartment, status: :ok
    end

    def update
        apartment = Apartment.find(params[:id])
        apartment.update(number: params[:number])
        render json: apartment, status: :ok
    end

    def destroy
        apartment = Apartment.find(params[:id])
        apartment.destroy
        head :no_content
    end

    private

    def error_not_found
        render json: { error: "Not found" }, status: :not_found
    end
    
end
