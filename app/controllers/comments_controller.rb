class CommentsController < ApplicationController
  def create
    @dictionary = Dictionary.find(params[:dictionary_id])
    @comment = @dictionary.comments.build(comment_params)
    @comment.user_id = current_user.id
      if @comment.save
        redirect_to dictionary_path(@dictionary)
      else
        flash.now[:notice] = 'コメントの投稿に失敗しました'
        render template: "dictionaries/show"
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :dictionary_id, :user_id)
  end
end
