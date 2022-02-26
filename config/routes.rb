Rails.application.routes.draw do
  root 'recipes#top'
  devise_for :users
  resources :recipes
end
