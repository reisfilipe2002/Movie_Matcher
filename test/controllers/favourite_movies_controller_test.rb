require "test_helper"

class FavouriteMoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get user:references" do
    get favourite_movies_user:references_url
    assert_response :success
  end


end
