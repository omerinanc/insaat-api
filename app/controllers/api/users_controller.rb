module Api
    class UsersController < ApplicationController
      include JwtHelper
      before_action :authenticate_request
        def baslat_post
          if @current_user
            post = @current_user.posts.build(post_params)
            if post.save
              render json: { message: "Post created successfully" }, status: :created
            else
              render json: { error: "Unable to create post" }, status: :unprocessable_entity
            end
          else
            render json: { error: "User not authenticated" }, status: :unauthorized
          end
        end
      private
  
      def authenticate_request
        @current_user = nil
      
        if request.headers['Authorization'].present?
          token = request.headers['Authorization'].split(' ').last
          puts "Received Token: #{token}"
  
          begin
            decoded_token = JwtHelper.decode(token)
            puts "Decoded Token: #{decoded_token.inspect}"
            puts "User ID from Decoded Token: #{decoded_token[0]["user_id"]}"
  
  
            if decoded_token.nil?
              render json: { error: 'Invalid token' }, status: :unauthorized
              return
            end
      
            @current_user = User.find(decoded_token[0]["user_id"])
      
          rescue JWT::DecodeError
            render json: { error: 'Invalid token' }, status: :unauthorized
            return
          rescue ActiveRecord::RecordNotFound
            render json: { error: 'User not found' }, status: :unauthorized
            return
          end
        else
          render json: { error: 'Token missing' }, status: :unauthorized
        end
      end
      
      
  
  
      
          private
      
          def post_params
            params.require(:post).permit(:content)
          end
      
      def create
        user = User.new(user_params)
        if user.save
          render json: { status: :created, user: user }
        else
          render json: { status: 422, errors: user.errors.full_messages }
        end
      end
  
      private
  
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end