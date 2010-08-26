require './test_helper'

ActionController::Routing::Routes.draw do |map|
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action'
  map.root :controller => :home
end
 
class HomeController < ActionController::Base

  openid_auth 'crowdint.com'

  WELCOME_MESSAGE = 'Welcome home'

  def index
    render :text => WELCOME_MESSAGE
  end

end

class ControllerTest < ActionController::IntegrationTest

  def test_successful_authentication

    get '/'

    # After the whole redirection process you were redirected to your home index
    assert_redirected_to :action => 'openid_auth_complete'
    #assert_equal HomeController::WELCOME_MESSAGE, @response.body

    # And information like your email was filled in session
    assert_redirected_to :action => 'index'
    assert_equal('test.email@crowdint.com', session['openid_email'], )

  end

end
