class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:destroy]
  before_action :authorize_user!

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :encrypted_password, :avatar)
  end
end
