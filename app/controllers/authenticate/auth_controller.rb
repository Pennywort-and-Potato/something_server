class Authenticate::AuthController < ApplicationController
  skip_before_action :authenticate_request
  before_action :authenticate_request, only: %i[ me ]

  def login
    user = User.find_by(username: login_params[:username])

    if user && user.authenticate(login_params[:password]) && !user[:is_deleted]
      token = jwt_encode({id: user[:id], email: user[:email], role: user[:role]})
      render json: {
        jwt: token,
        success: true,
        user: user.as_json(except: :password_digest)
        },
      status: :ok
    else
      send_error({
        error: "Incorrect username or password",
        success: false
      }, :unauthorized)
    end
  end

  def register
    register_params[:role] = "member"
    user = User.new(register_params)

    if user.save
      send_response(user.as_json(except: :password_digest), :created)
    else
      send_error(user.errors, :unprocessable_entity)
    end
  end

  def me
    send_response(@current_user.as_json(except: :password_digest))
  end

  private
    def login_params
      params.permit(:username, :password)
    end

    def register_params
      params.permit(:username, :email, :first_name, :last_name, :date_of_birth, :password)
    end
end
