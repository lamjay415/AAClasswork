class UsersController < ApplicationController

    # def index
    #     if params.has_key?(:magazine_id)
    #       # index of nested resource
    #       @articles = Article.where(magazine_id: params[:magazine_id])
    #     else
    #       # index of top-level resource
    #       @articles = Article.all
    #     end
    
    #     render json: @articles
    # end
    
    def index

        if params.has_key?(:username)
            @user = User.find_by(username: params[:username])
            render json: @user
        elsif params.has_key?(:id)
            @artworks = Artwork.where(artist_id: params[:id])
            @artworks += Artwork.joins(:artwork_shares).where("artwork_shares.viewer_id = ?", params[:id])
            render json: @artworks 
        else
            render json: User.all
        end

    end

    def create
        user = User.new(params.require(:user).permit(:username))
        if user.save
            render json: user
        else    
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        
        if @user.update(params.require(:user).permit(:username))
            render json: @user
        else
            render json:@user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
    end
    

end