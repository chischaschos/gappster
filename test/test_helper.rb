ENV["RAILS_ENV"] = "test"

$:.unshift File.expand_path('../../lib' , __FILE__)
$:.unshift File.dirname(__FILE__)

require 'rubygems'
require 'bundler/setup'
require 'rails_app_2.3.8/config/environment'
require 'test_help'
