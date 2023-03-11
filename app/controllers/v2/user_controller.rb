class V2::UserController < ApplicationController
  before_action :set_user, only: %i[ get_user_by_id update_user deactive_user ]

  def get_user_by_id
    send_response(@user.as_json(except: :password_digest))
  end

  def get_user_by
    criteria = {**find_user_params, is_deleted: false}
    query_limit = get_query_limit(params[:chunk], params[:page])

    users = get_user_by_criteria(criteria, query_limit[:chunk], query_limit[:offset])

    send_response(users.as_json(except: [:password_digest, :email, :role]))
  end

  def update_user
    check_user(@user, params[:password])

    if @user.update(update_params)
      send_response(@user.as_json(except: :password_digest))
    else
      send_error(@user.errors, :unprocessable_entity)
    end
  end

  def deactive_user
    check_user(@user, params[:password])

    if @user.update(is_deleted: true)
      send_response(@user.as_json(except: :password_digest))
    else
      send_error(@user.errors, :unprocessable_entity)
    end
  end

  private

  def get_user_by_criteria(criteria, chunk, offset)
    users = User.where(criteria)
      .order(id: :asc)
      .limit(chunk)
      .offset(offset)
    return users
  end

  def set_user
    @user = User.find(params[:id])

    if @user[:is_deleted]
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