Rails.application.routes.draw do
  
  resources :districts
  resources :items do
    collection do
      get :search
    end
  end

  resources :users, except: [:destroy] do
    collection do
      get :search
    end
  end
  
  root                     'static_pages#home'

  #get 'search'          => 'items#search'
  get 'results'         => 'items#results'
  get 'help'            => 'static_pages#help'
  get 'about'           => 'static_pages#about'
  get 'contact'         => 'static_pages#contact'

  get '/login', to: "logins#new"
  post '/login', to: "logins#create"
  get '/logout', to: "logins#destroy"


end
