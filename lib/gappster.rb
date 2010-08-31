require 'gapps_openid'
require "openid"
require 'openid/store/filesystem'


module Gappster

  module Configuration

    def authenticate_with_google(domain)
      class_eval %{
        include Gappster::Actions
        before_filter(:except => :receive_openid_response) { |controller| controller.send :prepare_openid_call, domain } 
      }
    end

  end

  module Actions

    def openid_auth_complete
      current_url = url_for(:action => 'openid_auth_complete', :only_path => false)
      parameters = params.reject { |k,v|request.path_parameters[k] }
      openid_response = consumer.complete(parameters, current_url)

      case openid_response.status
        when OpenID::Consumer::FAILURE
          if openid_response.display_identifier
            flash[:error] = ("Verification of #{openid_response.display_identifier}"\
                             " failed: #{openid_response.message}")
          else
            flash[:error] = "Verification failed: #{openid_response.message}"
          end
        when OpenID::Consumer::SUCCESS
          flash[:success] = ("Verification of #{openid_response.display_identifier}"\
                             " succeeded.")
        when OpenID::Consumer::SETUP_NEEDED
          flash[:alert] = "Immediate request failed - Setup Needed"
        when OpenID::Consumer::CANCEL
          flash[:alert] = "OpenID transaction cancelled."
        else
      end

      redirect_to :action => 'index'
    end

    protected

    def prepare_openid_call(domain)
      show_error_page unless is_valid_openid_state(domain)
      begin_openid_discovery(domain) unless session['openid_authenticated']
    end
 
    def is_valid_openid_state(domain)
      status = true
      if domain.nil?
        flash[:error] = "Enter an OpenID identifier"
        status = false
      end
      status 
    end

    def show_error_page
      render :text => 'Some error occurred'
    end

    def begin_openid_discovery(domain)
      begin
        openid_request = consumer.begin(domain)
      rescue OpenID::OpenIDError => e
        flash[:error] = "Discovery failed for #{domain}: #{e}"
        show_error_page
      end

      return_to = url_for :action => 'openid_auth_complete', :only_path => false
      realm = url_for :action => 'index', :id => nil, :only_path => false
      
      if openid_request.send_redirect?(realm, return_to, nil)
        redirect_to openid_request.redirect_url(realm, return_to, nil)
      else
        render :text => openid_request.html_markup(realm, return_to, nil, {'id' => 'openid_form'})
      end
    end

    def consumer
      if @consumer.nil?
        dir = Pathname.new(RAILS_ROOT).join('db').join('cstore')
        store = OpenID::Store::Filesystem.new(dir)
        @consumer = OpenID::Consumer.new(session, store)
      end
      return @consumer
    end

  end

end

class ActionController::Base
  extend Gappster::Configuration
end
