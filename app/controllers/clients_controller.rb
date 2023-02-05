class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def show
        render json: Client.find(params[:id])
    end

    private

    def not_found(invalid)
        render json: { error: "#{invalid.model} not found"  }
    end

end
