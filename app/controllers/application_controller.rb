class ApplicationController < ActionController::Base
    include ApplicationHelper




def welcom
if !logged_in?
    redirect_to dealers_path
end
    
end




end
