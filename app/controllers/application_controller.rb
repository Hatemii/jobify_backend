class ApplicationController < ActionController::API

  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, 'secret')
  end

  def decode_token(token)
    JWT.decode(token, 'secret') rescue nil
  end

  def bearer_token
    bearer_token = request.headers['Authorization'] # Authorization -> Bearer Token -> "token"
    bearer_token.split(" ")[1] if bearer_token
  end
  
  def logged_in_user
    if bearer_token
      # find user by token
      user = User.find_by(confirmation_token: bearer_token)
      return unless user
      
      # check expiration token
      return if (user.expire_token_at.to_i - Time.now.to_i) <= 0

      # return user
      user
    end
  end
  
  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in_user
  end

  def current_user
    logged_in_user
  end
end
