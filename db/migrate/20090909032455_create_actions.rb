class CreateActions < ActiveRecord::Migration
  def self.up
    create_table :actions do |t|
      t.integer  :character_id
      t.datetime :started_at
      t.integer  :duration
      t.integer  :type_id
      t.text     :affects # "{:energy=>10, :hunger=>-10, :mood=>5}"
      t.timestamps
    end
  end

  def self.down
    drop_table :actions
  end
end
