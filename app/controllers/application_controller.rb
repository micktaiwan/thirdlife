# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :set_locale
  layout 'general'
  include AuthenticatedSystem
  filter_parameter_logging :password
  
  def set_locale
    locale = I18n.locale = session[:locale] || I18n.default_locale
    p = params[:locale]
    return if not p
    if p == ''
      locale = (locale=='en'? 'fr':'en')
    else
      locale = p
    end
    session[:locale] = I18n.locale = locale
    
    #OPTIMIZE better locales handling
    #locale = params[:locale] || session[:locale] || (this_user.site_language if is_logged_in?) || I18n.default_locale
    #locale = AVAILABLE_LOCALES.keys.include?(locale) ? locale : I18n.default_locale
    #session[:locale] = I18n.locale = locale
  end
  
  def must_be_logged
    redirect_to url_for(:controller=>'welcome', :action=>'index') if not logged_in?
  end
  
end

