class UserController < ApplicationController
  before_action :require_login
  before_action :find_user, only: [:edit, :update]

  def index

  end

  def show
    # A ação show é usada para exibir o perfil do usuário
    @user = current_user
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'Usuário atualizado com sucesso.'
    else
      render :edit
    end
  end

  def find_user
    @user = User.find_by(id: params[:id])
    unless @user
      flash[:alert] = 'Usuário não encontrado.'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :name_user )
  end
end
