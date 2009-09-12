class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.integer   :user_id # belongs to 
      t.string    :name
      t.float     :age, :default=>0
      t.float     :energy, :default=>100
      t.float     :hunger, :default=>0
      t.float     :health, :default=>100
      t.integer   :xp, :default=>0
      t.integer   :mood, :default=>50
      t.integer   :money, :default=>0
      now = Time.zone.now
      t.datetime  :time_updated_at, :default=>now # last updated because of time passed
      t.datetime  :affected_at, :default=>now # last action update
      t.timestamps
    end
    add_index :characters, :user_id
  end

  def self.down
    drop_table :characters
  end
end

