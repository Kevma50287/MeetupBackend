require "test_helper"

class HangoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hangout = hangouts(:one)
  end

  test "should get index" do
    get hangouts_url, as: :json
    assert_response :success
  end

  test "should create hangout" do
    assert_difference("Hangout.count") do
      post hangouts_url, params: { hangout: { date: @hangout.date, host: @hangout.host, location: @hangout.location, participants: @hangout.participants, title: @hangout.title, what: @hangout.what, why: @hangout.why } }, as: :json
    end

    assert_response :created
  end

  test "should show hangout" do
    get hangout_url(@hangout), as: :json
    assert_response :success
  end

  test "should update hangout" do
    patch hangout_url(@hangout), params: { hangout: { date: @hangout.date, host: @hangout.host, location: @hangout.location, participants: @hangout.participants, title: @hangout.title, what: @hangout.what, why: @hangout.why } }, as: :json
    assert_response :success
  end

  test "should destroy hangout" do
    assert_difference("Hangout.count", -1) do
      delete hangout_url(@hangout), as: :json
    end

    assert_response :no_content
  end
end
