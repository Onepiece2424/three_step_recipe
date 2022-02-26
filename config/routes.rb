Rails.application.routes.draw do
  root 'recipes#top'
  devise_for :users
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/new'
  get 'recipes/edit'
end
