Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "games#new"
  resources :games, only: %i[new create update] do
    member do
      get :give_up
      get :challenge
      get :correct
    end
    resource :progresses, only: %i[new create]
  end
end
