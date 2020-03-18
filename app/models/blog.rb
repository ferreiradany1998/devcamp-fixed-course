class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged
  #Checks that body and title exist in the create command
  validates_presence_of :title, :body

  belongs_to :topic, optional: true

  #Dependent destroy allows us to delete all the blogs of the user
  #If the user deletes his account
  has_many :comments, dependent: :destroy

  def self.special_blogs
    all
  end

  def self.featured_blogs
    limit(2)
  end
end
