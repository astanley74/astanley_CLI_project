require_relative './version.rb'
require 'json'
require 'rest-client'
require 'dotenv/load'
require 'pry'
class AstanleyCLIProject::API
    # binding.pry
    def self.get_team
        call = RestClient.get("https://api.sportradar.us/nhl/trial/v7/en/seasons/2019/REG/standings.json?api_key=#{ENV['NHL_API_KEY']}")
        json = JSON.parse(call)
        all_teams = []
        pacific = json["conferences"][0]["divisions"][0]["teams"]
        central = json["conferences"][0]["divisions"][1]["teams"]
        atlantic = json["conferences"][1]["divisions"][0]["teams"]
        metro = json["conferences"][1]["divisions"][1]["teams"]

        pacific.each {|team| all_teams << team}
        central.each {|team| all_teams << team}
        atlantic.each {|team| all_teams << team}
        metro.each {|team| all_teams << team}
        # all_teams = json["conferences"][0]["divisions"][0]["teams"]
        # binding.pry
        AstanleyCLIProject::Team.new_team_hash(all_teams)
    end
end
# AstanleyCLIProject::API.get_team