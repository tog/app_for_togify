
STD_TEAMS = ["Athletic","Barcelona","At.Madrid","R.Madrid","Espanyol","Valencia"]

namespace :league do
  namespace :db do
    desc "Delete every team on the bd and recreate them"
    task :rebuild => :environment do
      create_teams
      create_matches
      create_user('test_admin', true)
    end
  end
end

def create_teams
  Team.delete :all
  User.delete :all
  STD_TEAMS.each{|name|
    User.delete_all "login = '#{name.downcase}'"
    user = create_user(name)
    Team.create :name => name, :description => "This should be a real description", :user => user
    
  }
end

def create_user(name, admin=false)
  user = User.new 
  user.login = name.downcase
  user.name = name
  user.email = "#{user.login}@#{user.login}.com"
  user.password = user.password_confirmation = user.login
  user.register! && user.activate!
  user
end

def create_matches
  Match.delete :all
  MatchNote.delete :all
  MatchGoal.delete :all
  
  weeks = {
    "10/19/2008" => ["Athletic-Barcelona","At.Madrid-R.Madrid","Espanyol-Valencia"],
    "10/26/2008" => ["Athletic-R.Madrid","Espanyol-Barcelona","At.Madrid-Valencia"]
  }
  weeks.each_pair{|d_day, matches|
    matches.each {|match|
      local, visitor = match.split '-'
      m = Match.create :match_day => d_day.to_date, :local => team(local), :visitor => team(visitor)
      create_a_few_notes_on_match(m)
      create_a_few_goals_on_match(m)
    }
  }
end
def create_a_few_notes_on_match(match)
  rand_within(1..15).times do
    match.notes.create(:minute => rand_within(0..90), :description => "This should be a real note about the match")
  end
end

def create_a_few_goals_on_match(match)
  options = {:player => "dr. who"}
  rand_within(0..6).times do
    options.merge!({:minute => rand_within(0..90)})
    rand_within(0..2) == 1 ?  match.local_goals.create(options) : match.visitor_goals.create(options)
  end
end



def team(name)
  Team.find_by_name(name)
end
def rand_within(range)
  rand(range.max - range.min) + range.min
end
