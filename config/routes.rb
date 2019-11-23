Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'rateroom#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'signup', to: 'sessions#signup'
  post 'signup', to: 'sessions#createuser'
  delete 'logout', to: 'sessions#destroy'
  get 'mybananas', to: 'banana#index'
  get 'banana/new', to: 'banana#new'
  get 'banana/rate', to: 'banana#show'
  post 'banana/new', to: 'banana#create'
  post 'banana/ripe/:id', to: 'banana#ripe'
  post 'banana/notripe/:id', to: 'banana#notripe'
  post 'banana/flag/:id', to: 'banana#flag'
  delete 'banana/remove/:id', to: 'banana#destroy'
end
