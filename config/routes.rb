Rails.application.routes.draw do

  devise_for :users

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

  root 'categories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
