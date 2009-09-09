class CreateActions < ActiveRecord::Migration
  def self.up
    create_table :actions do |t|
      t.integer :character_id
      t.integer :type_id
      t.integer :parameter
      t.datetime :started_at
      t.integer  :duration
      t.timestamps
    end
  end

  def self.down
    drop_table :actions
  end
end
