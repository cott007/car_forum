class CommentsController < ApplicationController
	def create
    @post = Post.find(params[:id])
    @comment = @post.comments.new(params.require(:comment).permit(:description))
    @comment.user_id = current_user.id
    @comment.save
    redirect_to post_path(@post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
  	redirect_to post_path(@post)
  end
end
