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

    def api_create(service)
      code = service[:code] == 400 ? :bad_request : :created

      render json: data, status: code
    end
  end
end
