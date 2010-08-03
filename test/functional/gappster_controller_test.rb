require File.expand_path(File.dirname(__FILE__) + '/../test_helper')


class GappsterController < ActionController::Base
end 

class GappsterControllerTest <  ActionController::TestCase
   def setup
     @controller = GappsterController.new
     @request    = ActionController::TestRequest.new
     @response   = ActionController::TestResponse.new
   end 

   def test_expected_methods
     assert_equal true, true
   end 
end
