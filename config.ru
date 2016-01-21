require_relative './initialization.rb'
require 'sinatra'
require 'slim'
require 'bcrypt'
require 'sass/plugin/rack'
require_relative './web/app.rb'

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

set :views, File.dirname(__FILE__) + "/web/views"
set :public_folder, File.dirname(__FILE__) + '/web/assets'

run Sinatra::Application
