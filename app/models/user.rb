class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #They must specify a name before registering, otherwise they will run into an error on first_name, last_name methods
  validates_presence_of :name

  def first_name
    #Grab the first piece of information before the space
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end
