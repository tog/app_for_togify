class CreateMatchNotes < ActiveRecord::Migration
  def self.up
    create_table :match_notes do |t|
      t.integer :minute
      t.text :description
      t.integer :match_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :match_notes
  end
end
