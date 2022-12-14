class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  skip_before_action :authorized, only: %i[create login logout]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    render json: @user, status: :created
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def login
    @user = User.find_by!(username: user_params[:username])
    if @user&.authenticate!(user_params[:password])
      token = generate_token(@user.id)
      render json: {user: @user, token: token}
    end
  end

  def logout
    @current_user = nil
    head :no_content
  end

  def profile

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :full_name, :password, :password_confirmation, :location, :gender, :age, :online_status)
    end
end
