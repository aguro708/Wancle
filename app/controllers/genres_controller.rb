class GenresController < ApplicationController
  skip_before_action :require_login
  skip_before_action :require_admin_login
  before_action :require_admin_already

  def show
    @genre=Genre.find(params[:id])
  	@posts=@genre.posts.order("id DESC").page(params[:page]).per(15)
  	@genres=Genre.all
  end

  def like
  	@genre=Genre.find(params[:id])
  	@all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').pluck(:post_id))
  	@genre_ranks = @all_ranks.select{ |post| post.genre_id == @genre.id }
  	@genre_ranks = Kaminari.paginate_array(@genre_ranks).page(params[:page]).per(15)
  	@genres=Genre.all
  end

  def favorite
  	@genre=Genre.find(params[:id])
  	@all_ranks=Item.find(Favorite.group(:item_id).order('count(item_id) desc').pluck(:item_id))
  	@genre_ranks=@all_ranks.select{ |item| item.post.genre_id == @genre.id }
  	@genre_ranks = Kaminari.paginate_array(@genre_ranks).page(params[:page]).per(16)
  	@genres=Genre.all
  end

  def order
  	@genre=Genre.find(params[:id])
  	@items1=Item.order("id DESC")
  	@items=@items1.select{ |item| item.post.genre_id == @genre.id }
  	@items = Kaminari.paginate_array(@items).page(params[:page]).per(16)
  	@genres=Genre.all
  end

end
