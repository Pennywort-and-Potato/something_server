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

  def validate_admin_permission
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

  # THIS FUNTION MAKE EVERYTHING EXTREMELY SLOW. NEED TO BE FIX TO USE
  def update_post_view_count(post)
    post.update(view: post.view + 1)

    post.content.each do |content|
      content.update(view: content.view + 1)
    end
  end
end