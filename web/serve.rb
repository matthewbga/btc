#!/usr/bin/env ruby
require 'sinatra'
require 'slim'
require_relative '../initialization.rb'

get '/login' do
  slim :login
end
