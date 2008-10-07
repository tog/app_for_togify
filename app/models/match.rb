class Match < ActiveRecord::Base
  belongs_to :local, :class_name => "Team", :foreign_key => "local_team_id"
  belongs_to :visitor, :class_name => "Team", :foreign_key => "visitor_team_id"
  has_many :notes, :class_name => "MatchNote"

  def match_date
    match_day.strftime("%B %d, %Y")
    
  end
end
