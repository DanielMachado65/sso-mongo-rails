# frozen_string_literal: true

class Api::V1::UserController < ApplicationController
  before_action :doorkeeper_authorize!

  def me
    render json: current_user
  end

  def sign_in
    
  end
end
