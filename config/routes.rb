Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :recipes, only: [:new, :create, :index, :show, :update, :edit]
  #get 'recipes/index' => 'recipes#index', as: 'recipes_index'
  resources :genres, only: [:create,:new, :index]
  resources :reports, only: [:create]
  resources :comments, only: [:create]
end
