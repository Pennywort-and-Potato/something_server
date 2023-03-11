class ApplicationController < ActionController::API
  include ActionController::Serialization
  include JwtAuth
  include Helper
  include CommonResponse
  include Notification

  before_action :authenticate_request

  private
    def authenticate_request
      header = request.headers["Authorization"]
      if request.headers["Authorization"] == nil
        return render json: {
          error: "Missing Token",
          success: false
        },
        status: :unauthorized
      end

      header = header.split(" ").last if header
      decoded = jwt_decode(header)

      @current_user = User.find(decoded[:id])

      MqttSocket.publish_all_connection(@current_user[:id])

      if @current_user[:is_deleted]
        return not_found("User")
      end

      rescue ActiveRecord::RecordNotFound
        return not_found("User")
      rescue TokenExpired
        return token_expired()
    end
end
