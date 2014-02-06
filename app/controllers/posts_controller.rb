class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
    authorize! :read, Post, message: "You need to be a confirmed friend/family member to view posts."
  end

  def show
    @post = Post.find(params[:id])
    @commentable = Post.find(params[:id])
    @comments = @commentable.comments
    @comment = Comment.new
    authorize! :read, Post, message: "You need to be a confirmed friend/family member to view posts."
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(params[:post])
    authorize! :create, Post, message: "You need to be a confirmed friend/family member to create a post."
    if @post.save
      flash[:notice] = "post was saved."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize! :edit, @post, message: "You need to own the post to edit it."
  end

  def update
    @post = Post.find(params[:id])
    authorize! :update, @post, message: "You need to own the post to edit it."
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    
    title = @post.title
    authorize! :destroy, @post, message: "You need to own the post to destroy it."
    if @post.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @post
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end
  end
end
