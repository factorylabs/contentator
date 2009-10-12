# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  uses_tiny_mce :options => { 
    :width => 400,
    :theme => 'advanced',
    :theme_advanced_disable => "anchor,blockquote,outdent,indent,image,cleanup,help,code,separator,hr,quote,removeformat,formatselect,fontselect,fontsizeselect,styleselect,sub, sup,forecolor,backcolor,forecolorpicker,backcolorpicker,charmap,visualaid"
  }
  
  helper_method :current_user

  private
  def current_user
    return true
  end  

end
