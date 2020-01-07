Rails.application.routes.draw do
  get 'genres/show'
  get 'search' => 'posts#search'
  get 'tops/home'
  get 'tops/about'
  root "tops#home"
  devise_for :users
  resources :posts do
  	resources :items,only:[:new,:create,:edit,:update,:destroy]
  end
  resources :genres,only:[:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
