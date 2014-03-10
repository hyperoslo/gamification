Gamification::Engine.routes.draw do
  resources :rewards, only: [:create]
end
