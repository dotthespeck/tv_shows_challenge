Rails.application.routes.draw do
  
  resources :television_shows, only: [:index, :show, :new, :create] do
    resources :characters, only: [:index, :show, :new, :create]
  end
end
