require "test_helper"

class UsersInChatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_in_chat = users_in_chats(:one)
  end

  test "should get index" do
    get users_in_chats_url, as: :json
    assert_response :success
  end

  test "should create users_in_chat" do
    assert_difference("UsersInChat.count") do
      post users_in_chats_url, params: { users_in_chat: { chat_id: @users_in_chat.chat_id, user_id: @users_in_chat.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show users_in_chat" do
    get users_in_chat_url(@users_in_chat), as: :json
    assert_response :success
  end

  test "should update users_in_chat" do
    patch users_in_chat_url(@users_in_chat), params: { users_in_chat: { chat_id: @users_in_chat.chat_id, user_id: @users_in_chat.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy users_in_chat" do
    assert_difference("UsersInChat.count", -1) do
      delete users_in_chat_url(@users_in_chat), as: :json
    end

    assert_response :no_content
  end
end
