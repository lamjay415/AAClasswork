class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :is_logged_in?
    def current_user 
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def is_logged_in?
        !!current_user
    end

    def log_in(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end

    def log_out!
        current_user.reset_session_token! if is_logged_in?
        session[:session_token] = nil 
        @current_user = nil
    end
end
