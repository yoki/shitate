$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'simplecov'
SimpleCov.start


def p!(obj)
  unless obj.class == String
    obj = obj.pretty_inspect
  end

  puts "--------------------------------------\n\n\n"
  puts obj +"\n\n"
  puts "--------------------------------------\n"
end

# print the position of current line
def pl(*args)
  str0 = "=== " + caller.first + "\n"

  str_out = args.inject(str0){|strs, obj| strs + obj.pretty_inspect.to_s}

  puts str_out
  str_out
end


  require 'rails'
  require 'rails/generators'
  require 'database_cleaner'
  require 'fake_gem'
  Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each {|f| require f}

  require 'fake_app'
  require "rails/test_help"
  require 'sqlite3'
  require 'factory_girl'
  include FactoryGirl::Syntax::Methods


DatabaseCleaner.strategy = :transaction

RSpec.configure do |config|
  config.before :suite do
    DatabaseCleaner.clean_with :truncation
  end
  config.before :each do
    DatabaseCleaner.start
  end
  config.after :each do
    DatabaseCleaner.clean
  end
  
  CreateAllTables.up unless ActiveRecord::Base.connection.table_exists? 'preference'
end



# Spork.prefork do  

# end


# Spork.each_run do
#   FactoryGirl.reload
#   Dir["#{File.dirname(__FILE__)}/../lib/*.rb"].each { |f| require f }
# end

