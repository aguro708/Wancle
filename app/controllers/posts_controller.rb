class PostsController < ApplicationController
  def index
    @posts=Post.all
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
  end

  def update
    @post=Post.find(params[:id])
    @post.update()
  end

  def destroy
    @post=Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path
    end
  end

  def search
  end
  private
  def post_params
    params.require(:post).permit(:content,:genre_id)
  end
end
