class BlogsChannel < ApplicationCable::Channel


  def subscribed
    stream_from "blogs_#{params['blog_id']}_channel"
  end

  #User out of our channel (exited)
  def unsubscribed

  end

  def send_comment(data)
    current_user.comments.create!(content: data['comment'], blog_id: data['blog_id'])
  end

end