class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.datetime :match_day
      t.integer :local_team_id
      t.integer :visitor_team_id
      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end
