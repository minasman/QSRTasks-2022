class Admins::MasqueradesController < Devise::MasqueradesController
  protected

  def after_masquerade_path_for(_resource)
    dashboard_path
  end

  def after_back_masquerade_path_for(_resource)
    dashboard_path
  end
end
