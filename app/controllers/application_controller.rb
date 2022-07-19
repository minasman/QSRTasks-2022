class ApplicationController < ActionController::Base
  before_action do
    Rack::MiniProfiler.authorize_request if current_user && current_user.admin?
  end

  include Pagy::Backend
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referer || dashboard_path)
  end

end
