Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/new'
  get 'recipes/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
