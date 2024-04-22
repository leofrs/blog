class PasswordResetsController < ApplicationController
  before_action :require_login, except: [:index, :create, :edit, :update]

  def index
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      user.generate_reset_password_token
      PasswordResetMailer.reset_password_email(user).deliver_now
      flash[:success] = "Instructions to reset your password have been sent to your email."
      redirect_to root_path
    else
      flash[:error] = "Email not found."
      @user = User.new
      render :edit
    end
  end

  def edit
    @user = User.find_by_reset_password_token(params[:reset_password_token])
    if @user.nil?
      flash[:error] = "Invalid reset password token."
      redirect_to root_path
    end
  end

  def update
    @user = User.find_by_reset_password_token(params[:reset_password_token])
    if @user.update(password_params)
      redirect_to login_path, notice: "Password successfully updated. Please login with your new password."
    else
      flash.now[:error] = "Failed to update password."
      puts @user.errors.full_messages
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password)
  end
end
