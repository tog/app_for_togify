class Match < ActiveRecord::Base
  belongs_to :local, :class_name => "Team", :foreign_key => "local_team_id"
  belongs_to :visitor, :class_name => "Team", :foreign_key => "visitor_team_id"
  has_many :notes, :class_name => "MatchNote", :order => "minute DESC"

  has_many :local_goals, :class_name => "MatchGoal", :conditions => {:team => 'local'}
  has_many :visitor_goals, :class_name => "MatchGoal", :conditions => {:team => 'visitor'}

  def match_date
    match_day.strftime("%B %d, %Y")
  end
  def local_score
    local_goals.size
  end
  def visitor_score
    visitor_goals.size
  end
end
