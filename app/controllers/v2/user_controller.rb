class V2::UserController < ApplicationController
  before_action :set_user, only: %i[ get_user_by_id update_user deactive_user ]

  def get_user_by_id
    render json: {
      data: @user.as_json(except: :password_digest),
      success: true
    }, status: :ok
  end

  def get_user_by

    chunk = params[:chunk] || 30
    page = params[:page] && params[:page] - 1 || 0
    offset = page * chunk

    paramx = find_user_params.merge({is_deleted: false})

    user = User.where(paramx)
                .order(id: :asc)
                .limit(chunk)
                .offset(offset)

    render json: {
      data: user.as_json(except: [:password_digest, :email, :role]),
      success: true
    }, status: :ok
  end

  def update_user
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

  def deactive_user
    if !@user.authenticate(params[:password])
      return render json: {
        error: "Invalid password",
        success: false
      },
      status: :bad_request
    end

    if @user.update(is_deleted: true)
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

  private

  def set_user
    @user = User.find(params[:id])

    if user[:is_deleted]
      return not_found("User")
    end

    rescue ActiveRecord::RecordNotFound
      return not_found("User")
  end

  def find_user_params
    params.permit(:username, :email, :id, :first_name, :last_name)
  end

  def update_params
    params.permit(:username, :first_name, :last_name)
  end
end