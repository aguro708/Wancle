class PostsController < ApplicationController
  def index
    @posts=Post.order("id DESC").page(params[:page]).per(15)
    @genres=Genre.all
  end

  def show
    @post=Post.find(params[:id])
    @items=Item.where(post_id: @post.id).order("id DESC").page(params[:page]).per(16)
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
    @all_ranks = Kaminari.paginate_array(@all_ranks).page(params[:page]).per(15)
    @genres=Genre.all
  end

  def search
    @post_or_item=params[:option]
    if @post_or_item=="1"
      @posts=Post.search(params[:search], @post_or_item).order("id DESC").page(params[:page]).per(15)
    else
      @items=Item.search(params[:search], @post_or_item).order("id DESC").page(params[:page]).per(16)
    end
  end

  private
  def post_params
    params.require(:post).permit(:content,:genre_id)
  end

end
