Rails.application.routes.draw do
  root "pages#home"

  resources :artists do
    resources :songs
  end

  namespace :api do
    resources :artists do
      resources :songs, only: [:show, :create, :destroy]
    end
  end
end
