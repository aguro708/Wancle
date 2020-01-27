Rails.application.routes.draw do
  get 'genres/show'
  get 'searchs' => 'posts#search'
  get 'tops/home'
  get 'tops/about'
  post "items/:item_id/favorites" => "favorites#create",as: "item_favorites"
  delete "items/:item_id/favorites" => "favorites#destroy"
  get "genres/:id/likes" => "genres#like",as: "genre_likes_order"
  get "posts/likes" => "posts#like",as: "post_likes_order"
  get "items/favorites" => "items#favorite",as: "item_favorites_order"
  get "genres/:id/favorites" => "genres#favorite",as: "genre_favorites_order"
  get "genres/:id/orders" => "genres#order",as: "genre_order"
  get "users/:user_id/followings" => "relationships#following",as: "user_following"
  get "users/:user_id/followers" => "relationships#follower",as: "user_follower"
  root "tops#home"
  devise_for :users, :controllers => {
    :sessions => "users/sessions",
    :passwords => "users/passwords",
    :registrations => "users/registrations"
  }
  resources :posts,only:[:index,:show,:new,:create,:update,:destroy] do
  	resources :items,only:[:new,:create,:update,:destroy]
  	resource :likes, only: [:create, :destroy]
  end
  resources :favorites,only:[:index]
  resources :likes,only:[:index]
  resources :users,only:[:show,:edit,:update,:destroy] do
  	resources :posts,only:[:edit] do
  		resources :items,only:[:edit]
  	end
  end
  resources :genres,only:[:show]
  resources :items,only:[:index]
  resources :relationships, only: [:create,:destroy]
  devise_for :admins, :controllers => {
    :sessions => "admins/sessions"
  }
  namespace :admins do
  	resources :posts,only:[:index,:show,:edit,:update,:destroy]
  	resources :users,only:[:index,:show,:edit,:update,:destroy]
    resources :items,only:[:index,:edit,:update,:destroy]
    resources :genres,only:[:show,:new,:create,:edit,:update,:destroy]
  end
  get "admin/posts/likes/" => "admins/posts#like"
  get "admins/searchs" => "admins/posts#search"
  get "admin/items/favorites" => "admins/items#favorite"
  get "admins/genres/:id/likes" => "admins/genres#like",as: "admins_genres_likes"
  get "admins/genres/:id/orders" => "admins/genres#order",as: "admins_genres_orders"
  get "admins/genres/:id/favorites" => "admins/genres#favorite",as: "admins_genres_favorites"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
