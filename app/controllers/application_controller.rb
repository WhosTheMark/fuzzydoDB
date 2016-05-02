class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :isHome?

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def isHome?
    @isHome = controller_name == "home"
  end

  # Get locale from top-level domain or return nil if such locale is not available
  # # You have to put something like:
  # #   127.0.0.1 application.com
  # #   127.0.0.1 application.it
  # #   127.0.0.1 application.pl
  # # in your /etc/hosts file to try this out locally
  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end
end
