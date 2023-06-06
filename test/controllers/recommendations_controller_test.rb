require "test_helper"

class RecommendationsControllerTest < ActionDispatch::IntegrationTest
  test "should get imdb:references" do
    get recommendations_imdb:references_url
    assert_response :success
  end

  test "should get user:references" do
    get recommendations_user:references_url
    assert_response :success
  end
end
