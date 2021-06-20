class ArtworkSharesController < ApplicationController
    def create
        artwork_share = ArtworkShare.new(params.require(:artwork_share).permit(:artwork_id, :viewer_id))
        if artwork_share.save
            render json: artwork_share
        else    
            render json: artwork_share.errors.full_messages, status: :unprocessable_entity
        end
    end
     def destroy
        @artwork_share = ArtworkShare.find(params[:id])
        @artwork_share.destroy
    end

end