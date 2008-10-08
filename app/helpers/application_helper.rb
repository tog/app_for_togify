# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def match_result(match)
    "#{match.local.name} #{match.local_score} - #{match.visitor_score} #{match.visitor.name}"
  end
  def matches_on_same_day(match)
    Match.find(:all, :conditions => {:match_day => match.match_day}) - [match]
  end
  
  def render_flash_messages
    flash.collect{|entry|
      content_tag(:div, entry[1], :class => "notice #{entry[0]}")
    }
  end
  
end
