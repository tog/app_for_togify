
STD_TEAMS = ["Athletic","Barcelona","At.Madrid","R.Madrid","Espanyol","Valencia"]

namespace :league do
  namespace :db do
    desc "Delete every team on the bd and recreate them"
    task :rebuild => :environment do
      create_teams
      create_matches
    end
  end
end

def create_teams
  Team.delete :all
  STD_TEAMS.each{|name|
    User.delete_all "login = '#{name.downcase}'"
    user = create_team_user(name)
    Team.create :name => name, :description => "This should be a real description", :user => user
    
  }
end

def create_team_user(name)
  user = User.new 
  user.login = name.downcase
  user.name = name
  user.password = user.password_confirmation = user.login
  user.register! && user.activate!
  user
end

def create_matches
  weeks = {
    "10/19/2008" => ["Athletic-Barcelona","At.Madrid-R.Madrid","Espanyol-Valencia"],
    "10/26/2008" => ["Athletic-R.Madrid","Espanyol-Barcelona","At.Madrid-Valencia"]
  }
  weeks.each_pair{|d_day, matches|
    matches.each {|match|
      local, visitor = match.split '-'
      Match.create :match_day => d_day.to_date, :local => team(local), :visitor => team(visitor)
    }
  }
end
def team(name)
  Team.find_by_name(name)
end
