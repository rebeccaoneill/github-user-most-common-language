# GitHub user most common language

## Overview
- Search for a GitHub user by their username.
- Display the most commonly used programming language for a GitHub user.
- Show basic information about the GitHub user, including:
  - Profile picture
  - Full name
  - Profile URL

## Technology used
Ruby on Rails: The core framework used for this application. Version 7.1.4
GitHub API: For fetching user and repository data.
Stimulus.js: Used for client-side validation of user input.

## Usage
This app uses GitHub API, and request rates are limited
To gain greater usage limits you can use a personal access token following the steps below:
- Create .env file
- Install the dotenv-rails gem if it's not already included in your Gemfile
- Generate access token:https://github.com/settings/tokens
- Add the following code to your .env file
  GITHUB_API_TOKEN=your_github_token_here
