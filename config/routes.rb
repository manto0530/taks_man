Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
 
  authenticated :user do
    root to: 'welcome#index', as: :authenticated_root
  end

  unauthenticated do
    root to: 'home#index', as: :unauthenticated_root
  end

  # resources :tasks

  # Define routes for welcome and home controllers
  # get 'welcome/index'
  # get 'home/index'
end
