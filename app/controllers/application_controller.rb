class ApplicationController < ActionController::API
    rescue_from User::NotAuthorized, with: :deny_access
    resuce_from ActiveRecord::RecordNotFound, with: :not_found
    resuce_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
    resuce_from JWT::DecodeError, with: :render_token_error
    protect_from_forgery with: :null_session
    before_action :authorized

    secret = Rails.application.secret_key_base

    def auth_header
        request.headers["Authorization"]
    end

    def generate_token(user_id)
        JWT.encode({user_id:user_id}, secret)
    end

    def decode_token(token)
        if auth_header
            token = auth_header.split(' ')[1]
            JWT.decode(token, secret)[0]["user_id"]
        end
    end

    def current_user
        if decode_token
            @current_user = user.find_by!(id: decode_token)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: {message: 'Please log in'}, status: :unauthorized unless logged_in?
    end

    private

    def deny_access
        head :forbidden
    end

    def unprocessable_entity(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end

    def not_found(exception)
        render json: {error: "#{exception.model} not found" }, status: :not_found
    end

    def render_token_error
        render json: {error:"Bad token"}, status: :unprocessable_entity
    end

end
