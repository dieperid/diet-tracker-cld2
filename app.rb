# frozen_string_literal: true

SERVICE_FOLDER = './app/services' unless defined?(SERVICE_FOLDER)
CONTROLLERS_FOLDER = './app/controllers' unless defined?(CONTROLLERS_FOLDER)
MODELS_FOLDER = './app/models' unless defined?(MODELS_FOLDER)
VIEWS_FOLDER = './app/views' unless defined?(VIEWS_FOLDER)
MIDDLEWARES_FOLDER = './app/middlewares' unless defined?(MIDDLEWARES_FOLDER)
CONFIG_FOLDER = './config' unless defined?(CONFIG_FOLDER)

require 'sinatra'
require 'pdf-reader'
require 'sinatra/activerecord'
require 'dotenv/load'
require "#{CONFIG_FOLDER}/logger"
require "#{SERVICE_FOLDER}/db_connection"

set :environment, ENV.fetch('RACK_ENV') || 'development'
use Rack::Session::Cookie, key: 'rack.session', path: '/', secret: ENV['SESSION_SECRET']
set :views, File.join(VIEWS_FOLDER)
set :logger, $logger

DBConnection.instance

Dir[File.join(CONTROLLERS_FOLDER, '*.rb')].sort.each { |file| require file }
Dir[File.join(MODELS_FOLDER, '*.rb')].sort.each { |file| require file }
Dir[File.join(MIDDLEWARES_FOLDER, '*.rb')].sort.each { |file| require file }

configure do
  enable :sessions
end

# use Auth

get '/' do
  'Hello World'
end
