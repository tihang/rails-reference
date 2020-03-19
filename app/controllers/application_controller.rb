class ApplicationController < ActionController::Base

    # def current_user
    #     User.find(session[:user]) if session[:user]
    # end

    def require_login
        redirect_to root_path unless session[:user]
    end
end
