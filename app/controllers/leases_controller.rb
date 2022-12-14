class LeasesController < ApplicationController

    #POST /leases
    def create 
        lease = Lease.create(lease_params)
        render json: lease, status: :created
    end

    #DELETE /lease/:id
    def destroy 
        lease = find_lease
        lease.destroy
        head :no_content
    end

    private

    def find_lease
        Lease.find(params[:id])
    end

    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end
end
