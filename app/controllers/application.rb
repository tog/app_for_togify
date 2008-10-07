class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  
  helper :all # include all helpers, all the time
  protect_from_forgery # :secret => '87b142b4741d5f326fcc25575dba3d80'
end
