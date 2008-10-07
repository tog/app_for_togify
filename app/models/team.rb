class Team < ActiveRecord::Base
  belongs_to :user
  has_many :local_matches, :class_name => "Match", :foreign_key => "local_team_id"
  has_many :visitor_matches, :class_name => "Match", :foreign_key => "visitor_team_id"
end
