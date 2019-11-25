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

      get '/invoices', to: "invoices#index"
      get '/invoices/find', to: "invoices#find"
      get '/invoices/find_all', to: "invoices#find_all"
      get '/invoices/random', to: "invoices#random"
      get '/invoices/:id', to: "invoices#show"

      get '/invoice_items', to: "invoice_items#index"
      get '/invoice_items/find', to: "invoice_items#find"
      get '/invoice_items/find_all', to: "invoice_items#find_all"
      get '/invoice_items/random', to: "invoice_items#random"
      get '/invoice_items/:id', to: "invoice_items#show"

      get '/transactions', to: "transactions#index"
      get '/transactions/find', to: "transactions#find"
      get '/transactions/find_all', to: "transactions#find_all"
      get '/transactions/random', to: "transactions#random"
      get '/transactions/:id', to: "transactions#show"

      namespace :merchants do
        get '/:id/items', to: "items#index"
        get '/:id/invoices', to: "invoices#index"
      end

      namespace :invoices do
        get '/:id/transactions', to: "transactions#index"
        get '/:id/invoice_items', to: "invoice_items#index"
        get '/:id/items', to: "items#index"
        get '/:id/customer', to: "customers#show"
        get '/:id/merchant', to: "merchants#show"
      end

      namespace :invoice_items do
        get '/:id/invoice', to: "invoices#show"
        get '/:id/item', to: "items#show"
      end

      namespace :items do
        get '/:id/invoice_items', to: "invoice_items#index"
      end
    end
  end
end
