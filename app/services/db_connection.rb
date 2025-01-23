# frozen_string_literal: true

require 'sinatra/activerecord'
require 'logger'

# Class for the database connection
class DBConnection
  include Singleton

  def initialize
    @environment = ENV['RACK_ENV']
    db_config = YAML.load_file('config/database.yml')[@environment]
    ActiveRecord::Base.establish_connection(db_config)
  end
end
