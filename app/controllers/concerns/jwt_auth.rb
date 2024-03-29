require 'jwt'

module JwtAuth
  extend ActiveSupport::Concern

  AUTH_SECRET = Rails.application.credentials.config[:AUTH_SECRET]

  def jwt_encode(payload, exp = 7.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, AUTH_SECRET)
  end

  def jwt_decode(token)
    decoded = JWT.decode(token, AUTH_SECRET)[0]
    HashWithIndifferentAccess.new decoded

    rescue JWT::ExpiredSignature, JWT::VerificationError
      raise TokenExpired.new
  end
end

class TokenExpired < StandardError
  def initialize(msg="Access Token expired. Please re-login")
    super(msg)
  end
end