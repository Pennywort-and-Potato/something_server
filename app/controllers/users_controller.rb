class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  def index
    @users = User.all

    render json: @users
  end

  def show
      render json: @user
  end

  def create
    @user = User.new(
      username: create_params[:username],
      first_name: create_params[:first_name],
      last_name: create_params[:last_name],
      date_of_birth: create_params[:date_of_birth],
      email: create_params[:email],
      password: create_params[:password],
      role: "member",
      is_deleted: false
    )

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(update_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:username, :first_name, :last_name, :date_of_birth, :email, :role, :is_deleted, :password)
    end

    def create_params
      params.permit(:username, :first_name, :last_name, :date_of_birth, :email, :password)
    end

    def update_params
      params.permit(:username, :first_name, :last_name, :date_of_birth, :email, :password)
    end
end
