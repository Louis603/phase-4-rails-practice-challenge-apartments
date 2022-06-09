class TenantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :error_unprocessable

    def index
        tenants = Tenant.all
        render json: tenants, status: :ok
    end

    def show
        student = Tenant.find(params[:id])
        render json: student, status: :ok
    end

    def create
        student = Tenant.create!(name: params[:name], age: params[:age])
        render json: student, status: :ok
    end

    def update
        student = Tenant.find(params[:id])
        student.update(name: params[:name], age: params[:age])
        render json: student, status: :ok
    end

    def destroy
        student = Tenant.find(params[:id])
        student.destroy
        head :no_content
    end

    private

    def error_not_found
        render json: { error: "Not found" }, status: :not_found
    end

    def error_unprocessable
        render json: { error: "Unprocessable Entity" }, status: :unprocessable_entity
    end
end
