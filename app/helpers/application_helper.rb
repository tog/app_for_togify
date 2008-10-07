# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def match_result(match)
    "#{match.local.name} #{match.local_score} - #{match.visitor_score} #{match.visitor.name}"
  end
end
