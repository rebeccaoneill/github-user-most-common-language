require "test_helper"

class GitHubControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get git_hub_index_url
    assert_response :success
  end
end
