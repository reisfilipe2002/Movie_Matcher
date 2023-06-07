require "test_helper"

class RecommendationsControllerTest < ActionDispatch::IntegrationTest
  test "should get user:references" do
    get recommendations_user:references_url
    assert_response :success
  end
end
