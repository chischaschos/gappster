require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class GappsterUnitController < ActionController::Base
end 

class GappsterUnitControllerTest <  Test::Unit::TestCase
  def test_expected_methods
    assert_equal GappsterUnitController.methods.grep(/gappster_authentication/).length, 1, 'This method has to exist'
    assert_equal GappsterUnitController.instance_methods.grep(/open_id_authentication/).length, 1, 'This method has to exist'
  end 
end
