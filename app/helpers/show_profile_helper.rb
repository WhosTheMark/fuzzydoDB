module ShowProfileHelper
  def show_profile(username)
    "#{root_url}/profile/#{username}"
  end
end
