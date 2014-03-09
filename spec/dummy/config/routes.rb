Rails.application.routes.draw do
  resources :articles

  mount Gamification::Engine => "/gamification"
end
