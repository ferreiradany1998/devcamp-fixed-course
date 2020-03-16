module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Devcamp Portoflio | Dany Coelho Ferreira"
    @seo_keywords = "Dany Coelho Ferreira Portoflio"
  end
end