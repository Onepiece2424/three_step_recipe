Rails.application.routes.draw do
  root 'recipes#top'
  devise_for :users
  resources :recipes do
    collection do
      get 'search'
    end
    resources :comments, only:[:create, :destroy]
  end
end
