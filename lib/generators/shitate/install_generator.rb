
require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record/migration'

module Shitate
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    extend ActiveRecord::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)
    class_option :with_changes, :type => :boolean, :default => false, 
    :desc => "Store preferences for each record"

    desc 'Generates (but does not run) a migration to add a preference table.'

    def create_migration_file
      migration_template 'create_preferences.rb', 'db/migrate/create_preferences.rb'
    end
  end
end
