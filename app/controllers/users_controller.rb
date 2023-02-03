class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  skip_before_action :authenticate_request, only: %i[ create ]

  def index
    @users = User.all

    render json: @users.as_json(except: :password_digest)
  end

  def show
      render json: @user.as_json(except: :password_digest)
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
      render json: @user.as_json(except: :password_digest), status: :created
    else
      render json: {error: @user.errors, detail: "Create user fails, please try again!"}, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(update_params)
      render json: @user.as_json(except: :password_digest)
    else
      render json: {error: @user.errors, detail: "Update user fails, please try again!"}, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

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
