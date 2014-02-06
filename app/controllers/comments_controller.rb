class CommentsController < ApplicationController
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment].merge(user_id: current_user.id))

    authorize! :create, @comment, message: "You need to be signed in to do that."
    if @comment.save
      flash[:notice] = "Comment was created."
      redirect_to (:back)
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to (:back)
    end
  end

  def destroy
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    
    authorize! :destroy, @comment, message: "You need to own the comment to delete it."
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to (:back)
    else
      flash[:error] = "Comment couldn't be deleted. Please try again."
      redirect_to (:back)
    end
  end

  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
