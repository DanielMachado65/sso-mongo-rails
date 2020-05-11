# frozen_string_literal: true

module Api::V1
  class ApiController < ::ApplicationController
    respond_to :json

    def current_user
      @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
    end

    def api_success(data)
      render json: data, status: :ok
    end

    def api_error(data = {})
      render json: data, status: :bad_request
    end

    def api_return(service, created = false)
      return api_bad_request(service[:error]) if service[:code] == 400

      created ? api_created(service) : api_success(service)
    end
  end
end
