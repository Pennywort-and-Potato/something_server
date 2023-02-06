class ApplicationController < ActionController::API
  include ActionController::Serialization
  include JwtAuth
  include Helper

  before_action :authenticate_request

  private
    def authenticate_request
      header = request.headers["Authorization"]
      if request.headers["Authorization"] == nil
        return render json: {
          error: "Unauthorized",
          detail: "Missing Token",
          success: false
        },
        status: :unauthorized
      end

      header = header.split(" ").last if header
      decoded = jwt_decode(header)

      @current_user = User.find(decoded[:id])

      if @current_user[:is_deleted]
        return render json: {
          error: "User not exist",
          detail: "Cannot find specific user" ,
          success: false
          },
        status: :not_found
      end

      rescue ActiveRecord::RecordNotFound
        return render json: {
          error: "User not exist",
          detail: "Cannot find specific user",
          success: false
        },
        status: :not_found
    end
end
