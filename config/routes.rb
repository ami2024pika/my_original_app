Rails.application.routes.draw do
  root "posts#index"
  devise_for :users
  resources :posts do
    resources :post_options
  end  
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
