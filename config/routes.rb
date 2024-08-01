Rails.application.routes.draw do
  root 'calendar#index'
  resources :calendar, only: [:index, :show]
  resources :tasks, only: [:new, :create]
end
