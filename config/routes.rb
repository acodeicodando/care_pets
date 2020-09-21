Rails.application.routes.draw do
  root 'pets#index'
  resources :pets, only: [:index, :new, :create, :edit, :update, :show]
end
