module Helper
  extend ActiveSupport::Concern

  def get_query_limit(chunk, page)
    procc = {}
    (!chunk || 30 < chunk) ? procc[:chunk] = 30 : procc[:chunk] = chunk
    procc[:page] = page && page - 1 || 0
    procc[:offset] = procc[:page] * procc[:chunk]
    return procc
  end

  def send_response(data, status = :ok)
    return render json: {
      data: data,
      success: true
    },
    status: :ok
  end

  def send_error(errors, status)
    return render json: {
      error: errors.as_json,
      success: false
    },
    status: status
  end

  def check_user(user, password)
    if !@user.authenticate(password)
      return render json: {
        error: "Invalid password",
        success: false
      },
      status: :bad_request
    end
  end

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

  # THIS FUNTION MAKE EVERYTHING EXTREMELY SLOW. NEED TO BE FIX TO USE
  def update_post_view_count(post)
    post.update(view: post.view + 1)

    post.content.each do |content|
      content.update(view: content.view + 1)
    end
  end
end