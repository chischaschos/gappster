require 'test_helper'

class AuthenticableTest < ActionController::IntegrationTest

  test 'successful authentication' do
  
    Gappster::Actions.mock(:begin_openid_discovery).with('crowdint.com').yields do
      redirect_to :action => :openid_auth_complete
    end

    get '/'
    assert_redirected_to :action => 'openid_auth_complete'
    follow_redirect!
    debugger
    assert_redirected_to :action => 'index'
    follow_redirect!
    assert_equal HomeController::WELCOME_MESSAGE, @response.body
    assert_equal 'test.email@crowdint.com', session['openid_email'] 

  end

end
