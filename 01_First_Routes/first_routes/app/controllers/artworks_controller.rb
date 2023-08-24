class ArtworksController < ApplicationController
    def index
        artworks = Artwork.artworks_for_user_id(params[:user_id])
        render json: artworks
    end



    def create
        artwork = Artwork.new(artwork_params)
        # replace the `artwork_attributes_here` with the actual attribute keys
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        artwork = Artwork.find_by(id: params[:id])
        if artwork.nil?
            render json: ['No artwork found'], status: 404 
        else
            render json: artwork
        end
    end

    def update 
        artwork = Artwork.find_by(id: params[:id])
        if artwork.nil?
            render json: ['No artwork found'], status: 404 
        elsif artwork.update(artwork_params)
            redirect_to artwork_url(artwork)
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])
        if artwork.nil?
            render json: ['No artwork found'], status: 404 
        else
            artwork.destroy
            redirect_to artworks_url()
        end
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end
