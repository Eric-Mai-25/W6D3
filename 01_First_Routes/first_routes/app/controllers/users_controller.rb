# app/controllers/users_controller.rb

class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def create
        user = User.new(user_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: params[:id])
        if user.nil?
            render json: ['No user found'], status: 404 
        else
            render json: user
        end
    end

    def update 
        user = User.find_by(id: params[:id])
        if user.nil?
            render json: ['No user found'], status: 404 
        elsif user.update(user_params)
            redirect_to user_url(user)
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        if user.nil?
            render json: ['No user found'], status: 404 
        else
            user.destroy
            redirect_to users_url()
        end
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end