module CommonResponse
  extend ActiveSupport::Concern

  def not_found(name) 
    return render json: {
      error: "#{name} not exist",
      success: false
    },
    status: :not_found
  end

  def forbidden 
    return render json: {
      error: "You dont have permission to access this resources",
      success: false
    },
    status: :forbidden
  end
end