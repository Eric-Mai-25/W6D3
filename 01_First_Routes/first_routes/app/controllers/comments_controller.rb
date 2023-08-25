class CommentsController < ApplicationController
    def index
        comments = comment_params
        render json: comments
    end

    def create
        comment = Comment.new(comment_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        if comment.nil?
            render json: ['No user found'], status: 404 
        else
            comment.destroy
            redirect_to comments_url()
        end
    end

    private

    def comment_params

        if :author_id.nil?
            Comment.find_by(params[:artwork_id])
        elsif :artwork_id.nil?
            Comment.comments_for_user_id(params[:author_id])
        else
            params.require(:comment).permit(:body, :author_id, :artwork_id)
        end
    end
end
