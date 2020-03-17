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

  #Example of how to get errors and manipulate them
  #We should use it for communicating with APIs etc.
  #We should not use them in our code, because it could be only a bad implementation
  #We should use validations, guest user, etc.
  def get_facebook_messages
    begin
      contacts_fb
      @messages = retrieve_messages
    rescue IOError => e
      flash[:error] = "Error occured contacting Facebook: #{e}"
    end
  end
end
