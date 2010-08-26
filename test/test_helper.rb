ENV["RAILS_ENV"] = "test"

$:.unshift File.expand_path('../../lib' , __FILE__)
$:.unshift File.dirname(__FILE__)

require 'rubygems'
require 'bundler/setup'
<<<<<<< HEAD
require 'rails_app_2.3.8/config/environment'
=======
require 'test/unit'
require "action_controller"
require 'gappster'
require 'gappster_consumer'
>>>>>>> e10ce6c11567d30e548f13ce45b247bbf74600d6
