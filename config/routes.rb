Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :messages, only: [:create] do
    resource :upvote, only: [:create]
    resource :downvote, only: [:create]
  end
  root to: "dashboards#show", as: :dashboard
end
