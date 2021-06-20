Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :create, :destroy, :update]
  resources :artworks, only: [:index, :show, :create, :destroy, :update]
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  
  get 'users/:id/artworks', to: 'users#index'
  get 'comments', to: 'comments#index'

  # get 'users', to: 'users#index'
  # post 'users', to: 'users#create'
  # get 'users/:id', to: 'users#show'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # delete 'users/:id', to: 'users#destroy'
  # get 'users/new', to: 'users#new'

  # get 'users/:id', to: 'users#show'

end
