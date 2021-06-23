class ApplicationController < ActionController::Base
    helper_method :login, :logged_in?, :current_user

    #login user sets session_token to user's session token
    #set current_user to user
    def login(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end

    #find user by session_token 
    #return nil if session_token is nil
    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    #check if current_user exists
    #!! turns the return into a boolean
    def logged_in?
        !!current_user
    end
end
