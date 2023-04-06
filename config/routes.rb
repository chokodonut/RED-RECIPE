Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'users/my_page' => 'users#show', as: 'my_page'
  get 'my_page/edit' => 'users#edit', as: 'user_edit'
  get 'my_page/:id/recipes' => 'users#index', as: 'user_recipes'
  resources :users, only: [:update]
  resources :recipes, only: [:new, :create, :index, :show, :update, :edit]
  resources :genres, only: [:create,:new, :index]
  resources :reports, only: [:create]
  resources :comments, only: [:create]
end
