class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        render :show
    end

    def new
        @user = User.new
        render :new
    end


    def create
        @user = User.new(params.require(:user).permit(:username, :password))
        if user.save
            login(@user)
            redirect_to user_url(@user)
        else
            render :new
        end
            
    end

end
