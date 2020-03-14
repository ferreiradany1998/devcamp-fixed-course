class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  #Define a method to make a query
  def self.angular
    where(subtitle: 'Angular')
  end

  #Define a scope instead of a method to make a query
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
end
