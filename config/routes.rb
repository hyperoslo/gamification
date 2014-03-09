Gamification::Engine.routes.draw do
  resources :scorings, only: [:create]
end
