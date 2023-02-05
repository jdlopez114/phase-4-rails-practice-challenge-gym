class MembershipsController < ApplicationController
    #Error handling 
    rescue_from ActiveRecord::RecordInvalid, with: :not_valid

    # def create 
    #     membership = Membership.create(
    #         gym_id: params[:gym_id],
    #         client_id: params[:client_id],
    #         charge: params[:charge]
    #     )

    #     if membership.valid?
    #         render json: membership, status: :created
    #     else
    #         render json: { error: membership.errors.full_messages }, status: 422
    #     end
    # end

    def create 
        render json: Membership.create!( membership_params )
    end

    private

    def membership_params
        params.permit( :gym_id, :client_id, :charge )
    end

    def not_valid( invalid )
        render json: { error: invalid.record.errors.full_messages }, status: 422
    end

end
