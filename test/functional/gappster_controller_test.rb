require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

ActionController::Routing::Routes.draw do |map|
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action'
  map.root :controller => :welcome
  map.fail 'fail', :controller => :welcome
end
 
class WelcomeController < ActionController::Base
  def index
    render :text => "Welcome"
  end
end

class GappsterController < ActionController::Base
  def index
    render :text => "Welcome"
  end
end

class GappsterControllerTest < ActionController::TestCase
  def setup
    @controller = GappsterController.new
  end

  def teardown
    @controller = nil
  end

  def test_authentication_success
    GappsterController.send(:gappster_authentication, 'crowdint.com')
    GappsterController.send(:before_filter, :authenticate_with_gapps)

    result = mock()
    result.expects(:successful?).returns(true)
    @controller.expects(:authenticate_with_open_id).multiple_yields([result, '', '', {'http://axschema.org/contact/email' => 'some@email.com'}])
    get :index
    assert_equal(session['gapps_email'], 'some@email.com')
    assert_redirected_to :root
  end

  def test_authentication_failure
    GappsterController.send(:gappster_authentication, 'crowdint.com')
    GappsterController.send(:before_filter, :authenticate_with_gapps)

    result = mock()
    result.expects(:successful?).returns(false)
    @controller.expects(:authenticate_with_open_id).multiple_yields([result, '', '', {'http://axschema.org/contact/email' => 'some@email.com'}])
    get :index
    assert_equal(session['gapps_email'], nil)
    assert_redirected_to :fail
  end
end
