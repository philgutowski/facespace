Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :messages, only: [:create] do
    resource :vote, only: [:create, :update]
  end
  root to: "dashboards#show", as: :dashboard
end
