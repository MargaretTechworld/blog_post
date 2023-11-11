Rails.application.routes.draw do
  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout" }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :show] do
        resources :posts, only: [:index]
      end

      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create, :destroy]
      end
    end
  end
end