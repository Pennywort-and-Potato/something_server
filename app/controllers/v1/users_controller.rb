class V1::UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  skip_before_action :authenticate_request, only: %i[ create ]

  def show
      render json: {
        data: @user.as_json(except: :password_digest),
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

    create_params[:role] = "member"
    user = User.new(create_params)

    if user.save
      render json: {
        data: user.as_json(except: :password_digest),
        success: true
      },
      status: :created
    else
      render json: {
        error: user.errors,
        success: false
      },
      status: :unprocessable_entity
    end
  end

  def update
    if @user[:id] != @current_user[:id] && !is_admin(@current_user)
      return forbidden()
    end

    if !@user.authenticate(params[:password])
      return render json: {
        error: "Invalid password",
        success: false
      },
      status: :bad_request
    end

    if @user.update(update_params)
      render json: {
        data: @user.as_json(except: :password_digest),
        success: true
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

  def destroy
    if !@user.authenticate(params[:password])
      return render json: {
        error: "Invalid password",
        success: false
      },
      status: :bad_request
    end
    @user.update(is_deleted: true)

    if @user.save
      render json: {
        success: true
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
      data: @current_user.as_json(except: :password_digest),
      success: true
    },
    status: :ok
  end

  private

    def set_user
      @user = User.find(params[:id])

      if @user[:is_deleted]
        return not_found("User")
      end

      rescue ActiveRecord::RecordNotFound
        return not_found("User")
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
