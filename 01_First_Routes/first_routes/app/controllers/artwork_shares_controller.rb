class ArtworkSharesController < ApplicationController
    def create
        artwork_share = ArtworkShare.new(artwork_share_params)
        # replace the `artwork_share_attributes_here` with the actual attribute keys
        if artwork_share.save
            render json: artwork_share
        else
            render json: artwork_share.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork_share = ArtworkShare.find_by(id: params[:id])
        if artwork_share.nil?
            render json: ['No artwork_share found'], status: 404 
        else
            artwork_share.destroy
            render json: artwork_share
        end
    end

    private

    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end
