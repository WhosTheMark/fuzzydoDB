module ProfileHelper
  def profile_path(username)
    "#{root_url}/profile/#{username}"
  end
end
