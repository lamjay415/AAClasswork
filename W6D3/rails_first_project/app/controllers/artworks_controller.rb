class ArtworksController < ApplicationController

    def index
        render json: Artwork.all
    end

    def create
        artwork = Artwork.new(params_artwork)
        if artwork.save
            render json: artwork
        else    
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: Artwork.find_by(id: params[:id])
    end

    def update 
        @artwork = Artwork.find_by(id: params[:id])
        
        if @artwork.update(params_artwork)
            render json: @artwork
        else
            render json:@artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @artwork = Artwork.find_by(id: params[:id])
        @artwork.destroy
    end

    private 
    def params_artwork
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end