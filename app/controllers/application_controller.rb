class ApplicationController < ActionController::Base
    before_action :require_login

    private

    def require_login
        unless current_user
        flash[:alert] = "Você precisa fazer login para acessar esta página."
        redirect_to login_path
        end
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    helper_method :current_user
end
