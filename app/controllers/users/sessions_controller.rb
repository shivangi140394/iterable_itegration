class Users::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    # Redirect to a custom path after login
    events_path
  end
end