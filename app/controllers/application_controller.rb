# frozen_string_literal: true

class ApplicationController < ActionController::Base
  respond_to :json

  def current_user
    @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
  end
end
