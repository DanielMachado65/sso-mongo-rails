# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'api/v1', controllers: {
    sessions: 'api/v1/sessions'
  }

  namespace :api do
    namespace :v1 do
      get 'me', to: 'user#me'
    end
  end

  use_doorkeeper
end
