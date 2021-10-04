class Api::V1::UsersController < ApplicationController
  before_action :user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render error: { error: 'Unable to create User' }, status: 400
    end
  end

  def update
    if @user.update(user_params)
      render json: { message: 'User succesffully updated.' }, status: 200
    elsif
      render error: { error: 'Unable to update User' }, status: 400
    end
  end

  def destroy
    if @user.destroy
      render json: { message: 'User successfully deleted.' }, status: 200
    else
      render error: { error: 'Unable to delete User' }, status: 400
    end
  end

  private
  def user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
