Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/merchants', to: "merchants#index"
      get '/merchants/find', to: "merchants#find"
      get '/merchants/find_all', to: "merchants#find_all"
      get '/merchants/random', to: "merchants#random"
      get '/merchants/:id', to: "merchants#show"

      get '/items', to: "items#index"
      get '/items/find', to: "items#find"
      get '/items/find_all', to: "items#find_all"
      get '/items/random', to: "items#random"
      get '/items/:id', to: "items#show"

      get '/customers', to: "customers#index"
      get '/customers/find', to: "customers#find"
      get '/customers/find_all', to: "customers#find_all"
      get '/customers/random', to: "customers#random"
      get '/customers/:id', to: "customers#show"
    end
  end
end
