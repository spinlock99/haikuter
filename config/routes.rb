Hikuter::Application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users
  resources :haiku
end
