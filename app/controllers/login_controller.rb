class LoginController < ApplicationController
  before_action :require_login, except: [:index, :create, :destroy]

  def index
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # Login bem-sucedido
      session[:user_id] = user.id
      redirect_to root_path, notice: "Login bem-sucedido!"
    else
      # Login falhou
      flash.now[:alert] = "Combinação de e-mail/senha inválida"
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logout realizado com sucesso!"
  end
end
