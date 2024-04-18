class RegisterController < ApplicationController
  before_action :require_login, except: [:index, :create]

  def index
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if User.exists?(email: user_params[:email])
      flash.now[:alert] = "Este email já está em uso. Por favor, use outro."
      redirect_to register_path
    elsif @user.save
      redirect_to login_path, notice: "Usuário criado com sucesso. Por favor, faça login."
    else
      flash.now[:alert] = "Ocorreram erros ao criar o usuário."
      redirect_to register_path
    end
  end

  private

  def user_params
    params.permit(:name, :name_user, :email, :password)
  end
end
