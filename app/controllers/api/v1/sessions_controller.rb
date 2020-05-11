# frozen_string_literal: true

module Api::V1
  class SessionsController < Devise::SessionsController
    skip_before_action :verify_authenticity_token, only: :create

    # POST /resource/sign_in
    def create
      binding.pry
    end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end
  end
end
