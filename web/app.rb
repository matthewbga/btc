#!/usr/bin/env ruby
require 'sinatra'
require 'sinatra/assetpack'
require 'slim'
require 'bcrypt'
require_relative '../initialization.rb'

class App < Sinatra::Base
  register Sinatra::AssetPack
  assets do
    js :main, [
      'assets/js/main.js'
    ]

    js :opportunities, [
      'assets/js/opportunties.js'
    ]

    css :main, [
      'assets/css/main.css'
    ]

    css :opportunties, [
      'assets/css/opportunties.css'
    ]

    js_compression :jsmin
    css_compression :sass
  end
end

get '/opportunities' do
  @opportunities = Opportunity.all.order('created_at DESC').limit(50)
  slim :opportunities
end
