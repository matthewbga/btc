#!/usr/bin/env ruby
require 'sinatra'
require 'slim'
require 'bcrypt'
require_relative '../initialization.rb'

get '/login' do
  slim :login
end

post '/login' do
end
