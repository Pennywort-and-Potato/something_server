class V2::PostController < ApplicationController
  before_action :set_post, only: %i[ get_post_by_id update_post deactive_post ]
  skip_before_action :authenticate_request, only: %i[ get_post_by_user_id get_post_by get_post_by_id]

  def get_post_by_id
    send_response(@post.as_json(include: :content))
  end

  def get_post_by_user_id
    query_limit = get_query_limit(params[:chunk], params[:page])
    criteria = {
      content: {
        is_deleted: false
      },
      user_id: params[:id],
      is_deleted: false
    }

    posts = get_post_by_criteria(criteria, query_limit[:chunk], query_limit[:offset])

    send_response(posts.as_json)
  end

  def get_post_by
    query_limit = get_query_limit(params[:chunk], params[:page])
    criteria = {
      content: {
        is_deleted: false
      },
      is_deleted: false,
      **find_post_params
    }

    posts = get_post_by_criteria(criteria, query_limit[:chunk], query_limit[:offset])

    send_response(posts.as_json)
  end

  def update_post
    if @post[:user_id] != @current_user[:id]
      forbidden()
    end

    if @post.update(update_post_params)
      send_response(@post.as_json)
    else
      send_error(@post.errors, :unprocessable_entity)
    end
  end

  def deactive_post
    if @post[:user_id] != @current_user[:id]
      forbidden()
    end

    if @post.update(is_deleted: true)
      send_response(@post.as_json)
    else
      send_error(@post.errors, :unprocessable_entity)
    end
  end

  def create_post
    ActiveRecord::Base.transaction do

      post = @current_user.post.new(
        title: params[:title],
        body: params[:body]
      )

      params[:contents].each do |content|
        post.content.new(
          alt: content[:alt],
          src: content[:src],
          content_type: content[:content_type]
        )
      end

      params[:tags].each do |tag|
        tag = Tag.where(tag: tag[:tag]).first_or_create
        post.post_tag.new(
          post_id: post[:id],
          tag_id: tag[:id]
        )
      end

      post.thumbnail = post.content.first[:src]
      if post.save

        @current_user.user_notification.create({
          body: "Post created",
          is_read: false
        })

        send_notification(@current_user[:id], "post.created")
        send_response(post.as_json(include: :content), :created)
      else
        send_error(post.errors, :unprocessable_entity)
      end
    end
  end

  private

  def get_post_by_criteria(criteria, chunk, offset)
    posts = Post.where(criteria)
      .order(id: :asc)
      .limit(chunk)
      .offset(offset)
    return posts
  end

  def set_post
    @post = Post.find(params[:id])

    if @post[:is_deleted]
      return not_found("Post")
    end

    rescue ActiveRecord::RecordNotFound
      return not_found("Post")
  end

  def find_post_params
    params.permit(:title, :body, :id)
  end

  def update_post_params
    params.permit(:title, :body)
  end
end