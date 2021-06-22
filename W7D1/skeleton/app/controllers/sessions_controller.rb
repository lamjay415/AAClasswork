class SessionsController < ApplicationController

    
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username],params[:user][:password])
        if @user
            log_in(@user)
            redirect_to cats_url
        else
            render :new
        end
    end

    def destroy 
        log_out!
        redirect_to cats_url
    end
    
end
