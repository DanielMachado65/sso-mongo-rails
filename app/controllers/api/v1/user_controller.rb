# frozen_string_literal: true

class Api::V1::UserController < ApplicationController
  before_action :doorkeeper_authorize!

  def index
    binding.pry
    render json: current_user
  end

  private

  def current_user
    @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
  end
end
