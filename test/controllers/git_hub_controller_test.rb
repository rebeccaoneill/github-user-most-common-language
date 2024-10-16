require "test_helper"
require "webmock/minitest"

class GitHubControllerTest < ActionDispatch::IntegrationTest
  WebMock.enable!

  test "should get index" do
    get git_hub_index_url
    assert_response :success
  end

  def setup
    @controller = GitHubController.new
  end

  # Tests I would include, to acommodate edge cases:
  # Member is not found '404 Not Found'
  # Member has no repositories 'none'
  # Member has 50% repositories in two languages, expect response to be one of the two languages
  # Member has 100% repositories in one language, expect response to be that language
  # Member is found and has repositories, expect response to be language
  # User tries to submit a blank string, request should fail

end
