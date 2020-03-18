class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true, length: { minimum: 5, maximum: 1000 }

  #Background job of the websocket
  #We do not do immediately the action, we do it when he have a chance
  after_create_commit { CommentBroadcastJob.perform_later(self) }
end
