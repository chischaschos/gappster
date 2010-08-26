require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  def setup
    @controller = HomeController.new
  end

  def teardown
    @controller = nil
  end

  def test_successful_authentication_with_google_domain

    get :index
    assert_redirected_to :action => 'openid_auth_complete'

  end

end
