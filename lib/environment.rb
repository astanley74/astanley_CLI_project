require 'pry'
require 'rest-client'
require 'json'
require 'dotenv/load'
require 'colorize'

require_relative "astanley_CLI_project/version.rb"
require_relative "astanley_CLI_project/cli.rb"
require_relative "astanley_CLI_project/api.rb"
require_relative "astanley_CLI_project/team.rb"

module AstanleyCLIProject
  class Error < StandardError; end
  # Your code goes here...
end
