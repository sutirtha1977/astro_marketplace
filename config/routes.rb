Rails.application.routes.draw do
  
  root 'categories#index'

  get 'admin', :to => 'access#main'
  get 'access/main'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  devise_for :users

  resources :admin_users, :except => [:show] do
    member do
      get :delete
    end
  end

  resources :categories do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end

  resources :listings do
    member do
      get :delete
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
