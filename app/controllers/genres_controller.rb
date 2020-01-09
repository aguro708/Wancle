class GenresController < ApplicationController
  def show
  	@genre=Genre.find(params[:id])
  	@posts=@genre.posts.order("id DESC")
  	@genres=Genre.all
  end

  def like
  	@genre=Genre.find(params[:id])
  	@all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').pluck(:post_id))
  	@genre_ranks = @all_ranks.select{ |post| post.genre_id == @genre.id }
  	@genres=Genre.all
  end

  def favorite
  	@genre=Genre.find(params[:id])
  	@all_ranks=Item.find(Favorite.group(:item_id).order('count(item_id) desc').pluck(:item_id))
  	@genre_ranks=@all_ranks.select{ |item| item.post.genre_id == @genre.id }
  	@genres=Genre.all
  end
  def order
  	@genre=Genre.find(params[:id])
  	@items1=Item.order("id DESC")
  	@items=@items1.select{ |item| item.post.genre_id == @genre.id }
  	@genres=Genre.all
  end
end
