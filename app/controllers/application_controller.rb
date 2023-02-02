class ApplicationController < ActionController::API
  include ActionController::Serialization
  include JwtAuth

  before_action :authenticate_request

  private
    def authenticate_request
      header = request.headers["Authorization"]
      if request.headers["Authorization"] == nil
        render json: {error: "Unauthorized", detail: "Missing Token"}, status: :unauthorized
        return;
      end
      header = header.split(" ").last if header
      decoded = jwt_decode(header)
    end
end
