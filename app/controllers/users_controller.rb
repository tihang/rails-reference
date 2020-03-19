class UsersController < ApplicationController
    def index
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user] = @user.id
            redirect_to players_path
        else
            render :index
        end   
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
end
