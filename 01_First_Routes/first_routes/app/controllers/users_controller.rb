# app/controllers/users_controller.rb

class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def create
        user = User.new(user_permit)
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user
    end

    def update 
        user = User.find_by(id: params[:id])
        user.update(user_permit)
        redirect_to user_url(user)
    end

    def destroy
        user = User.find_by(id: params[:id])
        user.destroy
        redirect_to users_url()
    end

    def user_permit
        params.require(:user).permit(:name , :email)
    end
end