Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :messages, only: [:create]
  root to: "dashboards#show", as: :dashboard
end
