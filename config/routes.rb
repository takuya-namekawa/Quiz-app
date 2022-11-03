Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "games#new"
  resources :games, only: %i[new create] do
    resource :progresses, only: %i[new create]
  end
end
