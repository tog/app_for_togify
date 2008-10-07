class CreateMatchGoals < ActiveRecord::Migration
  def self.up
    create_table :match_goals do |t|
      t.integer :match_id
      t.string :player
      t.string :team
      t.integer :minute

      t.timestamps
    end
  end

  def self.down
    drop_table :match_goals
  end
end
