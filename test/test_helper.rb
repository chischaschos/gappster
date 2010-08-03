ENV["RAILS_ENV"] = "test"
require 'test/unit'
require "action_controller"
require "action_controller/test_case"
require  File.expand_path(File.dirname(__FILE__) + '/../lib/gappster.rb')
