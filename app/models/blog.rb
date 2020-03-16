class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged
  #Checks that body and title exist in the create command
  validates_presence_of :title, :body

  belongs_to :topic, optional: true
end
