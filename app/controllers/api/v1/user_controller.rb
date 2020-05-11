# frozen_string_literal: true

module Api::V1
  class UserController < ApiController
    before_action :doorkeeper_authorize!

    def me
      api_success(current_user)
    end
  end
end
