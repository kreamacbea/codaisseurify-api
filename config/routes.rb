Rails.application.routes.draw do
  root "artists#index"

  resources :artists do
    resources :songs
  end

  namespace :api do
    resources :artists do
      resources :songs, only: [:show, :new, :edit, :update, :create, :destroy]
    end
  end
end
