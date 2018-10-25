Rails.application.routes.draw do
  resources :users
  resources :posts do
    resources :comments
  end

  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
