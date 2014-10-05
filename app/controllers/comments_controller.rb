class CommentsController < ApplicationController
  before_filter :load_commentable

  def create
    @comment = @commentable.comments.new(content: commments_params[:content])
    @comment.author_email = current_user.email

    if @comment.save
      redirect_to @commentable, notice: 'Comment added.'
    else
      redirect_to @commentable, notice: 'Not added correctlly.'
    end
  end

  def commments_params
    params.require(:comment).permit(:content,:commentable_id,:cresource)
  end

  def load_commentable
    @resource, id =  commments_params[:cresource],commments_params[:commentable_id]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end
end
