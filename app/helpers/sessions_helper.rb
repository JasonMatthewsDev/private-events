module SessionsHelper
    def logged_in?
        session[:user_id] ? true : false
    end
    
    def current_user
        logged_in? ? @current_user ||= User.find_by(id: session[:user_id]) : @current_user = nil
        @current_user
    end
end
