class Admin::AdminController < ApplicationController
  before_action :validate_admin_permission

  before_action :set_all_user, only: %i[ all_user ]
  before_action :set_user, only: %i[ get_user ]

  before_action :set_all_post, only: %i[ all_post ]

  before_action :set_all_content, only: %i[ all_content ]

  def all_user
    render json: {
      data: @all_user.as_json(except: :password_digest),
      success: true
    },
    status: :ok
  end

  def all_post
    render json: {
      data: @all_post.as_json(include: :content),
      success: true
    },
    status: :ok
  end

  def all_content
    render json: {
      data: @all_content.as_json(include: :post),
      success: true
    },
    status: :ok
  end

  def get_user
    render json: {
      data: @user.as_json(except: :password_digest),
      success: true
    },
    status: :ok
  end

  def get_post
    
  end

  private

    def set_all_user
      @all_user = User.all
    end

    def set_all_post
      @all_post = Post.includes(:content).all
    end

    def set_all_content
      @all_content = Content.includes(:post).all
    end

    def set_user
      @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        return render json: {
          error: "User not exist",
          success: false
        },
        status: :not_found
    end

    def set_post
      @post = Post.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        return not_found("Post")
    end

    def set_content
      @content = Content.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        return not_found("Content")
    end
end
