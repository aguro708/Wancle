class Admins::GenresController < ApplicationController
	skip_before_action :require_login
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

  def new
  	@genre=Genre.new
  	@genres=Genre.all
  end

  def create
  	@genre=Genre.new(genre_params)
  	@genres=Genre.all
  	if @genre.save
  		redirect_to admins_posts_path
  	else
  		render :new
  	end
  end

  def edit
  	@genre=Genre.find(params[:id])
  end

  def update
  	@genre=Genre.find(params[:id])
  	if @genre.update(genre_params)
  		redirect_to new_admins_genre_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@genre=Genre.find(params[:id])
  	@genre.destroy
  	redirect_to new_admins_genre_path
  end

  private
    def genre_params
		params.require(:genre).permit(:genre)
	end

end
