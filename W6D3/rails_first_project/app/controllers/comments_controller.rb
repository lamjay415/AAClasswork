class CommentsController < ApplicationController

    def index 
        if params[:user]
            @comments = Comment.joins(:author).where(user_id: params[:user])
            render json: @comments
        elsif params[:artwork]
            @comments = Comment.joins(:artwork).where(artwork_id: params[:artwork])
            render json: @comments
        else
            render json: Comment.all
        end
    end

    def create
        @comment = Comment.new(comments_params)
        if @comment.save
            render json: @comment
        else
            render json:@comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    private 
    def comments_params
        params.require(:comment).permit(:body,:user_id, :artwork_id)
    end

end