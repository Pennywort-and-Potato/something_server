class AuthController < ApplicationController
  skip_before_action :authenticate_request

  def login
    @user = User.find_by(username: login_params[:username])

    if @user && @user.authenticate(login_params[:password])
      token = jwt_encode({id: @user[:id], email: @user[:email], role: @user[:role]})
      render json: {jwt: token}
    else
      render json: {error: "Unauthorize", detail: "Wrong username or password"}, status: :unauthorized
    end
  end

  private
    def login_params
      params.permit(:username, :password)
    end
end
