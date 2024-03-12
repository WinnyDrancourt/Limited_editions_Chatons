class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:destroy]
  before_action :authorize_user!

  def show
    @user
  end

  def edit
    @user
  end

  def destroy
    @user.destroy
    sign_out(@user)
    redirect_to root_path, notice: 'Your account has been successfully deleted.'
  end

  private

  def set_user
    @user = current_user
  end

  def authorize_user!
    unless current_user == @user
      redirect_to root_path
    end
  end
end
