class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform comment
    ActionCable.server.broadcast "blogs_#{comment.blog.id}_channel", comment: render_comment(comment)
  end

  #locals is a local variable that is present in this class
  private
  def render_comment comment
    CommentsController.render partial: 'comments/comment', locals: {comment: comment}
  end
end