Rails.application.routes.draw do
  namespace :api do
    # resources :robots, only: [:create]
    post 'update', to:'robots#update'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
