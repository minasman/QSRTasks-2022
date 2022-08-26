module ApplicationHelper
  include Pagy::Frontend

  def mobile_device?
    request.user_agent =~ /Mobile|webOS|Macintosh/
  end

end
