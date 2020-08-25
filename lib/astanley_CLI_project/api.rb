require_relative './version.rb'
require 'json'
require 'rest-client'
require 'dotenv/load'
require 'pry'
class AstanleyCLIProject::API
    def self.get_team
        call_1 = RestClient.get("https://api.sportradar.us/nhl/trial/v7/en/seasons/2019/REG/standings.json?api_key=#{ENV['NHL_API_KEY']}")
        json = JSON.parse(call_1)

        teams = json["conferences"][0]["divisions"][0]["teams"]
        AstanleyCLIProject::Team.new_team(teams)
        # binding.pry
    end
end
# AstanleyCLIProject::API.new.get_team