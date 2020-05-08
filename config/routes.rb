Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users

  namespace :api do
    namespace :v1 do
      get 'me', to: 'user#index'
    end
  end
end
