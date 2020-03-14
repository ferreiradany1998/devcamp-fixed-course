class Portfolio < ApplicationRecord
  include Placeholder

  validates_presence_of :title, :body, :main_image, :thumb_image

  #Define a method to make a query
  def self.angular
    where(subtitle: 'Angular')
  end

  #Define a scope instead of a method to make a query
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end

  #self.main_image ||= "http://placehold.it/600x400" replaces the following code:
  #if self.main_image == nil
  #. self.main_image = http://placehold.it/600x400
  #end
end
