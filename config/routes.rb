Rails.application.routes.draw do
  root 'welcome#index'

  resources :merchants, only: [:index]

  get 'merchants/:id/dashboard', to: 'merchants#show'

  resources :merchants do
    resources :invoices, only: %i[index show]
    resources :items, only: %i[index show new create edit update]
    resources :invoice_items, only: [:update]
    resources :discounts, only: %i[index new create show edit update destroy]
  end

  namespace :admin do
    resources :dashboard, only: %i[index show]
    resources :invoices, only: %i[index show update]
    resources :merchants, except: [:destroy]
  end
end
