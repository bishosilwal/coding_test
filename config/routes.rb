Rails.application.routes.draw do
  resources :employments, only: [:new, :create]
  resources :people, only: [:new, :create, :update]
  get 'dashboard/index'
  get 'employments', to:'dashboard#person_employment', as: :person_employment
  root 'dashboard#index'
end
