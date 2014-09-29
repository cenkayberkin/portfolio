class CommentsController < ApplicationController
  def create

    @article = Article.find(commments_params[:article_id])
    @comment = @article.comments.new(commments_params)
    @comment.save

    if @comment.save
      redirect_to [@article], notice: 'Comment added.'
    else
      redirect_to [@article], notice: 'Not added correctlly.'
    end
  end

  def commments_params
    params.require(:comment).permit(:content,:article_id)
  end
end
