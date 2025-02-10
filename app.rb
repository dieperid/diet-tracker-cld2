# frozen_string_literal: true

SERVICE_FOLDER = './app/services' unless defined?(SERVICE_FOLDER)
CONTROLLERS_FOLDER = './app/controllers' unless defined?(CONTROLLERS_FOLDER)
MODELS_FOLDER = './app/models' unless defined?(MODELS_FOLDER)
VIEWS_FOLDER = './app/views' unless defined?(VIEWS_FOLDER)
MIDDLEWARES_FOLDER = './app/middlewares' unless defined?(MIDDLEWARES_FOLDER)
CONFIG_FOLDER = './config' unless defined?(CONFIG_FOLDER)

require 'sinatra'
require 'dotenv'
require 'securerandom'
require './app/helpers/auth_helper'
require 'chartkick'
require 'cloudinary'
require "#{SERVICE_FOLDER}/db_connection"

Dotenv.load

set :environment, ENV.fetch('RACK_ENV')
set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
set :views, File.join(VIEWS_FOLDER)

Cloudinary.config do |config|
  config.cloud_name = ENV['CLOUDINARY_CLOUD_NAME']
  config.api_key = ENV['CLOUDINARY_API_KEY']
  config.api_secret = ENV['CLOUDINARY_API_SECRET']
  config.secure = true
end

DBConnection.instance
helpers AuthHelper

Dir[File.join(CONTROLLERS_FOLDER, '*.rb')].sort.each { |file| require file }
Dir[File.join(MODELS_FOLDER, '*.rb')].sort.each { |file| require file }
Dir[File.join(MIDDLEWARES_FOLDER, '*.rb')].sort.each { |file| require file }

configure do
  enable :sessions
end

get '/' do
  if logged_in?(session)
    @connected_user = current_user(session)
    erb :home
  else
    redirect '/login'
  end
end

use Auth
