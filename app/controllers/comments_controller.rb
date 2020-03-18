class CommentsController < ApplicationController
  #Since there is a relationship between comments and user
  #it will allow us to directly create the comment
  #and automatically associate it to the user
  def create
    @comment = current_user.comments.build(comment_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
