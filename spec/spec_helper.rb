ENV['RAILS_ENV'] = 'test'

require File.expand_path( '../dummy/config/environment.rb', __FILE__ )

require 'bundler/setup'
require 'rspec/rails'

SCHEMA_PATH = File.expand_path File.join( File.dirname( __FILE__ ), 'dummy', 'db', 'schema.rb' )

RSpec.configure do |config|
  config.order = 'random'

  config.before( :suite ) do
    ActiveRecord::Migration.verbose = false
    load SCHEMA_PATH
  end
end
