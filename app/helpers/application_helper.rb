module ApplicationHelper
  #Since this is ruby code, to process html we must add .html_safe
  #def sample_helper
   # "<p>My Helper</p>".html_safe
  #end
  #Expect a parameter (style) and pass a default value if not set ""
  def login_helper style = ""
    #Check if the current_user is a Devise user class
    if current_user.is_a?(GuestUser) 
      #Since these are method calls, ruby will skip the first one and only
      #Print the second one, so we must be careful and concatenate!
      (link_to "Login", new_user_session_path, class: style) +
      " ".html_safe + 
      (link_to "Register", new_user_registration_path, class: style) 
    else 
      link_to "Logout", destroy_user_session_path, method: :delete, class: style 
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

  def nav_items
    [
      {
        url: root_path,
        title: "Home"
      },
      {
        url: about_me_path,
        title: "About Me"
      },
      {
        url: contact_path,
        title: "Contact"
      },
      {
        url: blogs_path,
        title: "Blog"
      },
      {
        url: portfolios_path,
        title: "Portfolio"
      },
      {
        url: tech_news_path,
        title: "Tech News"
      }
    ]
  end

  #Iterate through the nav_items array and for each print html code
  def nav_helper style, tag_type
    nav_links = ""

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  #This allows us to have a big string interpelation.
  #It must start at the LEFT SIDE of the IDE
  #This is a way to create navbar items by passing as parameter style and tagtype
#  def nav_helper style, tag_type
#nav_links = <<NAV
#<#{tag_type}><a href="#{root_path}" class="#{style} #{active? root_path}">Home</a></#{tag_type}>
#<#{tag_type}><a href="#{about_me_path}" class="#{style} #{active? about_me_path}">About Me</a></#{tag_type}>
#<#{tag_type}><a href="#{contact_path}" class="#{style} #{active? contact_path}">Contact</a></#{tag_type}>
#<#{tag_type}><a href="#{blogs_path}" class="#{style} #{active? blogs_path}">Blog</a></#{tag_type}>
#<#{tag_type}><a href="#{portfolios_path}" class="#{style} #{active? portfolios_path}">Portfolio</a></#{tag_type}>
#NAV
 #   nav_links.html_safe
  #end

  def active? path
    "active" if current_page? path
  end


#Is there a flash alert? If not is there a flash error? If not is there a flash notice? If not returns nil
#if there is one of them, it returns true and the variable gets saved into alert
  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Dany Coelho Ferreira Portfolio", sticky: false, time: 10000)
  end
end





