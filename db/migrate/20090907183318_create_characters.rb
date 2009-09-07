class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.integer   :user_id # belongs to 
      t.string    :name
      t.float     :age, :default=>0
      t.float     :energy, :default=>100
      t.timestamps
    end
    add_index :characters, :user_id
  end

  def self.down
    drop_table :characters
  end
end

