module ApplicationHelper
  #Since this is ruby code, to process html we must add .html_safe
  #def sample_helper
   # "<p>My Helper</p>".html_safe
  #end
  def login_helper
    #Check if the current_user is a Devise user class
    if current_user.is_a?(User) 
      link_to "Logout", destroy_user_session_path, method: :delete 
    else 
      #Since these are method calls, ruby will skip the first one and only
      #Print the second one, so we must be careful and concatenate!
      (link_to "Login", new_user_session_path) +
      "<br>".html_safe + 
      (link_to "Register", new_user_registration_path) 
    end 
  end

  def sample_helper
    content_tag(:div, "My Content", class: "my-class")
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you are on the layout #{layout_name}"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end
end
