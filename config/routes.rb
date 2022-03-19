Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root 'recipes#top'
  devise_for :users
  resources :recipes do
    collection do
      get 'search'
    end
    resources :comments, only:[:create, :destroy]
  end
  resources :users, only: :show
end
