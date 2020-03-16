module CurrentUserConcern
  extend ActiveSupport::Concern

  #Override the current_user method
  #This method is provided by devise gem
  #The super is used when overriding methods
  #The super says to not change anything even if we are overriding, keep the
  #method the same as it is.
  def current_user
    #Super here checks if there is a current_user, returning true
    #And keeping his behaviour, if it is false, it does the right part
    #Of the double pipe which creates a "type" of user
    super || guest_user
  end

  #it is a best practice to separate a big line code into a method
  def guest_user
    OpenStruct.new(name: "Guest User", 
                   first_name: "Guest", 
                   last_name: "User", 
                   email: "Guest@example.com")
  end
end