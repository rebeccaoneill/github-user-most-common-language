require 'open-uri'
require 'json'

class GitHubController < ApplicationController

  def index
  end

  def search
    @member = params[:member].strip
    find_member_info(@member)
    most_common_language = most_common_language(find_repositories(@member))
    render json: {
      language: most_common_language,
      member: @member,
      image_url: @image,
      name: @name,
      profile_url: @profile
    }
  end

  private

  def find_member_info(member)
    url = "https://api.github.com/users/#{member}"
    member_serialized = URI.parse(url).read
    member = JSON.parse(member_serialized)
    @name = member['name']
    @image = member['avatar_url']
    @profile = member['html_url']
  end

  def find_repositories(member)
    url = "https://api.github.com/users/#{member}/repos"
    member_repos_serialized = URI.parse(url).read
    member_repos = JSON.parse(member_repos_serialized)
  end

  def most_common_language(member_repos)
    if member_repos.empty? || member_repos.nil?
      return 'none'
    end

    # member_repos = find_repositories(@member)
    languages = member_repos.map { |repo| repo['language'] }
    # returns an array with the most common language for each repo
    language_hash = Hash.new(0)
    languages.each do |language|
      language_hash[language] += 1
    end
    language_hash.key(language_hash.values.max)
    # identifies the most common language
  end
end
