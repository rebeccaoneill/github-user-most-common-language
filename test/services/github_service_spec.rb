require "rails_helper"

RSpec.describe GithubService, type: :service do
  let(:github_service) { described_class.new("user") }

  describe "#most_common_language" do
    it "returns all languages with the highest values" do
      member_repos = [
        { "language" => "Ruby" },
        { "language" => "Python" },
        { "language" => "Ruby" },
        { "language" => "JavaScript" },
        { "language" => "Python" }
      ]
      expect(github_service.most_common_language(member_repos:)).to match_array(["Ruby", "Python"])
    end

    it "returns a single language when only one language has the highest value" do
      member_repos = [
        { "language" => "Ruby" },
        { "language" => "JavaScript" },
        { "language" => "Ruby" },
        { "language" => "Python" },
        { "language" => "Ruby" }
      ]
      expect(github_service.most_common_language(member_repos:)).to eq("Ruby")
    end

    it "returns 'none' when the member_repos array is empty" do
      member_repos = []
      expect(github_service.most_common_language(member_repos:)).to eq("none")
    end

    it "returns all languages when all values are the same" do
      member_repos = [
        { "language" => "Ruby" },
        { "language" => "JavaScript" },
        { "language" => "Python" }
      ]
      expect(github_service.most_common_language(member_repos:)).to match_array(["Ruby", "JavaScript", "Python"])
    end
  end
end
