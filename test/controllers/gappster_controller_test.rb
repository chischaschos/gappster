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

class ControllerTest < ActionController::TestCase

  def setup
    @controller = HomeController.new
  end

  def teardown
    @controller = nil
  end

  def test_successful_authentication_with_google_domain

    # Get index
    get :index

    # You're not authenticated, but, since this controller uses a google domain,
    # you'll be redirect to a google authentication page.
    # TODO: Test the redirection process somehow
    
    # After the whole redirection process you were redirected to your home index
    assert_redirected_to :action => 'openid_auth_complete'
    #assert_equal HomeController::WELCOME_MESSAGE, @response.body

    # And information like your email was filled in session
    assert_redirected_to :action => 'index'
    assert_equal('test.email@crowdint.com', session['openid_email'], )

  end

end
