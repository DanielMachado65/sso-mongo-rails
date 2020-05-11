# frozen_string_literal: true

module Api::V1
  class SessionsController < Devise::SessionsController
    skip_before_action :verify_authenticity_token, only: :create

    # POST /resource/sign_in
    def create
      service = Api::V1::UserService.create(params)

      render json: service, status: service[:code] == 400 ? :bad_request : :created
    end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end
  end
end
