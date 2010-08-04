require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class GappsterConsumerController < ActionController::Base
end 

class GappsterConsumerControllerTest < Test::Unit::TestCase
  def test_expected_methods
    assert_equal(GappsterConsumerController.methods.grep(/gappster_authenticable/).length, 1, 'This method has to exist')
    instance_methods = GappsterConsumerController.instance_methods
    assert_true(instance_methods.include?(:gappster_start), 'Gappster authentication has to be startable')
    assert_true(instance_methods.include?(:gappster_complete), 'Gappster authentication has to be completeable')
  end
end
