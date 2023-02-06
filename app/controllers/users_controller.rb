class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  before_action :grant_admin_permission, only: %i[ index ]
  skip_before_action :authenticate_request, only: %i[ create ]

  def index
    users = User.all
    render json: {
      users: users.as_json(except: :password_digest),
      success: true
    },
    status: :ok
  end

  def show
      render json: {
        user: @user.as_json(except: :password_digest),
        success: true
      },
      status: :ok
  end

  def create

    if !validate_password(create_params[:password])
      return render json: {
        success: false,
        error: "Invalid password"
      },
      status: :bad_request
    end

    user = User.new(
      username: create_params[:username],
      first_name: create_params[:first_name],
      last_name: create_params[:last_name],
      date_of_birth: create_params[:date_of_birth],
      email: create_params[:email],
      password: create_params[:password],
      role: "member",
    )

    if user.save
      render json: {
        user: user.as_json(except: :password_digest),
        success: true
      },
      status: :created
    else
      render json: {
        error: user.error,
        success: false
      },
      status: :unprocessable_entity
    end
  end

  # def update

  #   if @user[:id] != @current_user[:id] && !is_admin(@current_user)
  #     return render json: {
  #       error: "Access Denied",
  #       success: false, detail: "You dont have permission to access this resources"
  #     },
  #     status: :forbidden
  #   end

  #   if @user.update(update_params)
  #     render json: {
  #       user: @user.as_json(except: :password_digest),
  #       success: true
  #     },
  #     status: :ok
  #   else action_failed("Update", "user", @user.errors, :unprocessable_entity)
  #   end
  # end

  def destroy
    @user.update(is_deleted: true)

    puts @user

    if @user.save
      render json: {
        success: true,
        # user: @user.as_json(except: :password_digest)
      },
      status: :ok
    else
      render json: {
        error: user.errors,
        success: false
      },
      status: :unprocessable_entity
    end
  end

  def me
    render json: {
      user: @current_user.as_json(except: :password_digest),
      success: true
    },
    status: :ok
  end

  private

    def set_user
      @user = User.find(params[:id])

      if @user[:is_deleted] && !is_admin(@current_user)
        return render json: {
          error: "User not exist",
          success: false
        },
        status: :not_found
      end

      rescue ActiveRecord::RecordNotFound
        return render json: {
          error: "User not exist",
          success: false
        },
        status: :not_found
    end

    def user_params
      params.permit(:username, :first_name, :last_name, :date_of_birth, :email, :role, :is_deleted, :password)
    end

    def create_params
      params.permit(:username, :first_name, :last_name, :date_of_birth, :email, :password)
    end

    def update_params
      params.permit(:username, :first_name, :last_name, :date_of_birth, :email)
    end

    def delete_params
      params.permit(:id, :password)
    end
end
