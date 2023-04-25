Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'

  namespace :admin do
    root to: 'homes#top'
    get ':id/recipes' => 'users#index', as: 'admin_index'
    get 'reports/:id' => 'users#report', as: 'user_report'
    resources :recipe, only: [:show]
    resources :users, only: [:show, :destroy]
    resources :genres, only: [:create,:new, :index, :update, :destroy, :edit]
  end

  get 'search' => 'searchs#search'
  get 'users/my_page/' => 'users#my_page', as: 'my_page'
  get 'my_page/edit' => 'users#edit', as: 'user_edit'
  get 'my_page/:id/recipes' => 'users#recipe_index', as: 'user_recipes'
  resources :users, only: [:update, :show, :index] do
    get :book_marks, on: :collection
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end

  resources :recipes do
    resources :comments, only: :create
    resource :book_marks, only: [:create, :destroy]
    resources :reports, only: [:create, :new, :index]
  end
end
