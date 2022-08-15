Rails.application.routes.draw do
  resources :people
  get 'dashboard/index'
  root 'dashboard#index'
end
