Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "top#index"
  resources :groups do
    resources :messages, only: [:index, :create]
  end
  resources :users do
    collection do
      get 'search'
    end
  end
end
