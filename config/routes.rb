Rails.application.routes.draw do
  get 'genres/show'
  get 'search' => 'posts#search'
  get 'tops/home'
  get 'tops/about'
  post "items/:item_id/favorites" => "favorites#create",as: "item_favorites"
  delete "items/:item_id/favorites" => "favorites#destroy"
  get "genres/:id/likes" => "genres#like",as: "genre_likes_order"
  get "posts/likes" => "posts#like",as: "post_likes_order"
  get "items/favorites" => "items#favorite",as: "item_favorites_order"
  get "genres/:id/favorites" => "genres#favorite",as: "genre_favorites_order"
  get "genres/:id/orders" => "genres#order",as: "genre_order"
  root "tops#home"
  devise_for :users
  resources :posts do
  	resources :items,only:[:new,:create,:edit,:update,:destroy]
  	resource :likes, only: [:create, :destroy]
  end
  resources :users,only:[:show,:edit,:update,:destroy]
  resources :genres,only:[:show]
  resources :items,only:[:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
