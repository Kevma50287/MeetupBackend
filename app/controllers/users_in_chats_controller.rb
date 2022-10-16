class UsersInChatsController < ApplicationController
  before_action :set_users_in_chat, only: %i[ show update destroy ]

  # # GET /users_in_chats
  # def index
  #   @users_in_chats = UsersInChat.all

  #   render json: @users_in_chats
  # end

  # # GET /users_in_chats/1
  # def show
  #   render json: @users_in_chat
  # end

  # POST /users_in_chats
  def create
    @users_in_chat = UsersInChat.new(users_in_chat_params)

    if @users_in_chat.save
      render json: @users_in_chat, status: :created, location: @users_in_chat
    else
      render json: @users_in_chat.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /users_in_chats/1
  # def update
  #   if @users_in_chat.update(users_in_chat_params)
  #     render json: @users_in_chat
  #   else
  #     render json: @users_in_chat.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /users_in_chats/1
  def destroy
    @users_in_chat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_in_chat
      @users_in_chat = UsersInChat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def users_in_chat_params
      params.require(:users_in_chat).permit(:user_id, :chat_id)
    end
end
