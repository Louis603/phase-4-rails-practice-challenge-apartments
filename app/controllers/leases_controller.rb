class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :error_unprocessable

    def create
        lease = Lease.create!(rent: params[:rent], apartment_id: params[:apartment_id], tenant_id: params[:tenant_id])
        render json: lease, status: :ok
    end

    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
        head :no_content
    end

    private

    def error_not_found
        render json: { error: "Not found" }, status: :not_found
    end

    def error_unprocessable
        render json: { error: "Apartment and Tenant must exist" }, status: :unprocessable_entity
    end
end
