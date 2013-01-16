
module Shitate
  def self.enabled=(value)
    Shitate.config.enabled = value
  end

  def self.enabled?
    !!PaperTrail.config.enabled
  end

  def self.load!
    require "shitate/version"
    require 'shitate/config'
    require 'shitate/preference'
    require 'shitate/has_shitate'

    ActiveSupport.on_load(:active_record) do
      ::ActiveRecord::Base.send :include, Shitate::Model
    end

  end

  private
  def self.config
    @@config ||= PaperTrail::Config.instance
  end
end

Shitate.load!
