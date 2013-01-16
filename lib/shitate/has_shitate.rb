module Shitate::Model
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def has_shitate(options={})
      has_many :preferences, :as => :shitateable
      
      send :include, InstanceMethods

      class_attribute :default_preferences
      self.default_preferences = options[:default]

      define_getter
      define_setter
    end

    private

    def define_getter
      self.default_preferences.each_pair do |key, default_value|
        define_method(key) do
          @preference_hash = preference_hash

          if @preference_hash[key]
            @preference_hash[key]
          else
            default_value
          end
        end

        end
      end


    def define_setter
      self.default_preferences.each_pair do |key, default_value|
        define_method((key.to_s + '=').to_sym ) do |new_value|
          @preference_hash = preference_hash
          current_value =  @preference_hash[key]

          if current_value and new_value.to_s != current_value.to_s
            pref = preferences.where(key: key).limit(1).first
            pref.value = new_value

          elsif not current_value and new_value.to_s != default_value.to_s
            pref = Preference.new
            pref.shitateable = self
            pref.key = key.to_s
            pref.value = new_value
            pref.save!
          end

          if pref 
            if pref.valid?
              @preference_hash = nil
              pref.save
            else
              pref.errors.full_messages.each{|msg| errors.add :base, msg}
              false
            end
          else
            # data is same as old value
            true
          end
        end
      end

    end

  end

  module InstanceMethods
    def preference_hash
      if @preference_hash
        @preference_hash
      else
        self.preferences.all.inject(HashWithIndifferentAccess.new()) do |hash, pref| 
          hash[pref.key.to_sym] = pref.value
          hash
        end
      end
    end
  end
end



