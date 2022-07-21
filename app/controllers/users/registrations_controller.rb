# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    build_resource
    yield resource if block_given?
    respond_with resource
    # authorize @user, policy_class: UserPolicy
  end

  # POST /resource
  def create
    build_resource(sign_up_params)
    resource.organization_id = current_user.organization_id
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def require_no_authentication
    assert_is_devise_resource!
    return unless is_navigational_format?

    no_input = devise_mapping.no_input_strategies
    authenticated =
      if no_input.present?
        args = no_input.dup.push scope: resource_name
        warden.authenticate?(*args)
      else
        warden.authenticated?(resource_name)
      end
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :phone, :admin, :rate, :payroll_id, :position_id, :active, :organizations_id, :birthdate, :hire_date, { store_ids: [] }, { tclass_ids: [] }])
  end

 # If you have extra params to permit, append them to the sanitizer.
 def configure_account_update_params
  devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :phone, :admin, :rate, :payroll_id, :position_id, :active, :organizations_id, :birthdate, :hire_date, { store_ids: [] }, { tclass_ids: [] }])
end

# The path used after sign up.
def after_sign_up_path_for(_resource)
  dashboard_path
end

# The path used after sign up for inactive accounts.
def after_inactive_sign_up_path_for(_resource)
  dashboard_path
end

def after_update_path_for(_resource)
  dashboard_path
end
end
