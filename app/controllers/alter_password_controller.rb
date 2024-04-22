class AlterPasswordController < ApplicationController
  before_action :require_login

  def edit_password
    @user = current_user
  end

  def update_password
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: 'Senha atualizada com sucesso!'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
