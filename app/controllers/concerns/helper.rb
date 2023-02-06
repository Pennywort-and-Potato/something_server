module Helper
  extend ActiveSupport::Concern

  def is_admin(user)
    return user[:role] == "admin"
  end

  def is_moderator(user)
    return user[:role] == "moderator" || user[:role] == "admin"
  end

  def validate_password(password)
    return password && password =~ /\A[a-zA-Z0-9]+\Z/
  end

  def grant_admin_permission
    if !is_admin(@current_user)
      return render json: {
        error: "You dont have permission to access this resources",
        success: false
      },
      status: :forbidden
    end
  end

  def action_failed(action, on, errors, status)
    render json: {
      error: errors,
      detail: "#{action} #{on} fails, please try again!",
      success: false
    },
    status: status
  end
end