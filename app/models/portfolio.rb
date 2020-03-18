class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['name'].blank? }
  
  #include Placeholder

  validates_presence_of :title, :body #, :main_image, :thumb_image

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  #Define a method to make a query
  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order("position ASC")
  end

  #Define a scope instead of a method to make a query
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  #If we want to set_defaults after initializing the class
  #after_initialize :set_defaults

  #def set_defaults
    #self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    #self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  #end

  #self.main_image ||= "http://placehold.it/600x400" replaces the following code:
  #if self.main_image == nil
  #. self.main_image = http://placehold.it/600x400
  #end
end
