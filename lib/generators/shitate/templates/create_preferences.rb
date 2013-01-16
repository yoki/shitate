
class CreatePreferences < ActiveRecord::Migration
  
  def self.up
    create_table :preferences do |t|
      t.string     :key
      t.string     :value
      t.datetime   :updated_at
      t.string     :shitateable_type
      t.integer    :shitateable_id
    end

    add_index :preferences, :shitateable_id
  end

  def self.down
    drop_table :preferences
  end

end