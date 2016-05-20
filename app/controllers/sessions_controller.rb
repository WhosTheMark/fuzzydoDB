class SessionsController < Devise::SessionsController

  # Override create method
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?

    respond_to do |format|
      p format
      format.html { respond_with resource, location: after_sign_in_path_for(resource) }
      format.json { render :json  => {}, :status => :ok }
    end
  end

end