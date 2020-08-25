require_relative './version.rb'
require 'json'
require 'rest-client'
require 'dotenv/load'
require 'pry'
class AstanleyCLIProject::API
    def self.start
        call_1 = RestClient.get("https://api.sportradar.us/nhl/trial/v7/en/seasons/2019/REG/standings.json?api_key=#{ENV['NHL_API_KEY']}")
        json = JSON.parse(call_1)
        teams = json["conferences"][0]["divisions"][0]["teams"]
    end
end
AstanleyCLIProject::API.new.start