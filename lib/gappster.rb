require 'gapps_openid'

module Gappster

  def self.included(cls) 
    cls.extend(ClassMethods)
  end

  module ClassMethods
    def openid_auth(identifier)
      class_eval %{
        before_filter :openid_start
      }
    end
  end

  def openid_auth_complete
    session['openid_authenticated'] = true
    session['openid_email'] = 'test.email@crowdint.com'
    redirect_to :action => 'index'
  end

  protected

  def openid_start
     openid_auth_begin unless session['openid_authenticated']
  end

  def openid_auth_begin
    redirect_to :action => 'openid_auth_complete'
  end

end

class ActionController::Base
  include Gappster
end
