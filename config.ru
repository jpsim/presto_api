require 'rubygems'
require 'bundler'

Bundler.require

require './app.rb'
use Rack::Throttle::Hourly, :max => 100
run Sinatra::Application
