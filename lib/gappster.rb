require 'gapps_openid'

module Gappster

  module ClassMethods
    def openid_auth(identifier)
      class_eval %{
        include Gappster::InstanceMethods
        before_filter :openid_start, :except => :openid_auth_complete
      }
    end
  end

  module InstanceMethods
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

end

class ActionController::Base
  extend Gappster::ClassMethods
end
