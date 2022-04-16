Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'recipes#top'
  devise_for :users
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
