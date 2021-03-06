# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'f92c99c75424ae3a97cc0033145fe066'

  def rescue_action(e)
    p e
    LOGGER.error e.message
    LOGGER.error e.backtrace.join("\n")
    render :file => "#{RAILS_ROOT}/public/error.html"
  end

  def current_user
    @user ||= User.find session[:user_id] if session[:user_id]
  end
end
