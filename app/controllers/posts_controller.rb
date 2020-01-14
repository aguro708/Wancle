class PostsController < ApplicationController
  def index
    @posts=Post.order("id DESC")
    @genres=Genre.all
  end

  def show
    @post=Post.find(params[:id])
  end

  def new
    @post=Post.new
    @genres=Genre.all
  end

  def create
    @post=Post.new(post_params)
    @post.user_id=current_user.id
    if @post.save
      redirect_to posts_path
    else
      @genres=Genre.all
      render :new
    end
  end

  def edit
    @post=Post.find(params[:id])
    @genres=Genre.all
  end

  def update
    @post=Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      @genres=Genre.all
      render :edit
    end
  end

  def destroy
    @post=Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path
    end
  end

  def like
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').pluck(:post_id))
    @genres=Genre.all
  end

  def search
    @post_or_item=params[:option]
    if @post_or_item=="1"
      @posts=Post.search(params[:search], @post_or_item)
    else
      @items=Item.search(params[:search], @post_or_item)
    end
  end

  private
  def post_params
    params.require(:post).permit(:content,:genre_id)
  end
end
