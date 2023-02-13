class Admin::AdminController < ApplicationController
  before_action :validate_admin_permission

  before_action :set_all_user, only: %i[ all_user ]
  before_action :set_user, only: %i[ get_user ]
  before_action :set_post, only: %i[ get_post ]
  before_action :set_content, only: %i[ get_content ]

  def get_all_user
    @all_user = User.all
    render json: {
      data: @all_user.as_json(except: :password_digest),
      success: true
    },
    status: :ok
  end

  def get_all_post
    @all_post = Post.all
    render json: {
      data: @all_post.as_json(include: :content),
      success: true
    },
    status: :ok
  end

  def get_all_content
    @all_content = Content.all
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
    render json: {
      data: @post.as_json(include: :content),
      success: true
    },
    status: :ok
  end

  def get_content
    render json: {
      data: @content.as_json(include: :post),
      success: true
    },
    status: :ok
  end

  private

    def set_user
      @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        return not_found("User")
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
