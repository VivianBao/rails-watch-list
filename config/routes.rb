Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists#index'
  get '/new', to: 'lists#new', as: :new_list
  post '/', to: 'lists#create'
  resources :lists, except: [:index, :new, :destroy] do
    resources :bookmarks, only: [ :new, :create, :destroy ]
  end
end
