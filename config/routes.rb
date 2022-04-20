Rails.application.routes.draw do
  root 'recipes#top'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  namespace :admin do
    resources :recipes do
      collection do
        get 'search'
      end
      resources :comments, only:[:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users
  end
  resources :recipes do
    collection do
      get 'search'
    end
    resources :comments, only:[:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
