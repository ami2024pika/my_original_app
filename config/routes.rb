Rails.application.routes.draw do
  root "posts#index"
  devise_for :users
  
  resources :categories, only: [:show]
  
  resources :posts do
    resources :post_comments, only: [:create]
    resources :votes, only: [:create]
  end
  
  resources :users, only: :show
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
