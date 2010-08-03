$LOAD_PATH << File.expand_path('../../lib' , __FILE__)

ENV["RAILS_ENV"] = "test"

require 'rubygems'
require 'bundler/setup'
require 'test/unit'
require "action_controller"
require 'gappster'
