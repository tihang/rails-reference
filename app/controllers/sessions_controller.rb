class SessionsController < ApplicationController
    def index
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user] = user.id
            redirect_to sessions_path
        else
            flash[:errors] = "Invalid Username or Password"
            redirect_to root_path
        end
    end

    def destroy
        session[:user] = nil
        redirect_to root_path
    end
end
