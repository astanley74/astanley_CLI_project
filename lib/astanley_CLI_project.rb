require 'pry'
require 'json'
require 'rest-client'
require 'dotenv/load'

require_relative "astanley_CLI_project/version"
require_relative "astanley_CLI_project/cli"
require_relative "astanley_CLI_project/api"
require_relative "astanley_CLI_project/team"

module AstanleyCLIProject
  class Error < StandardError; end
  # Your code goes here...
end
