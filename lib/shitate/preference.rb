# encoding : utf-8
class Preference < ActiveRecord::Base
  belongs_to :shitateable,  :polymorphic => true
  validates :key, presence: true
  validate :shitateable, presence: true
  attr_accessible :key, :store_id, :value

  validate :check_value
  validate :check_uniqueness
  validate :check_valid_key

  private
  def check_uniqueness
    # TODO check uniquness of key given shitateable
    true
  end

  def check_valid_key
    # TODO check key is in the list of valid keys
    true
  end


  def check_value
    return false unless key
    
    case key.to_sym
    when :name
      validate_longer_than_or_equal_to 1
    when :max_seats
      validate_integer
      validate_between 1, 500
    when :register_passcode
      validate_longer_than_or_equal_to 4
    when :printer_ip
      validate_longer_than_or_equal_to 7
    when :print_every_user_slip
      validate_boolean
    end
  end

  def validate_longer_than_or_equal_to(num)
    unless value and value.to_s.length >= num
      errors.add :base, "#{key} must be longer than #{num} letters."
    end
  end

  def validate_integer
    unless value.to_i.to_s == value.to_s
      errors.add :base,  "#{key} must be number."
    end
  end

  def validate_between(int1, int2)
    unless value.to_i >= int1 and value.to_i <= int2
      errors.add :base,  "#{key} must be between #{int1} and #{int2} in length"
    end
  end

  def validate_boolean
    unless ['0', '1', 0, 1, false, true].include? value
      errors.add :base, key_in_ja + '#{key} must be boolean'
    end
  end
end

# t.string     :name
# t.string     :value
# t.datetime   :updated_at
# t.string     :shitateable_type
# t.integer    :shitateable_id
