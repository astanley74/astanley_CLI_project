class AstanleyCLIProject::API
    # binding.pry
    def self.get_team
        call = RestClient.get("https://api.sportradar.us/nhl/trial/v7/en/seasons/2020/REG/standings.json?api_key=#{ENV['NHL_API_KEY']}")
        json = JSON.parse(call)
        
        all_teams = []
        north = json["conferences"][0]["divisions"][0]["teams"]
        cent = json["conferences"][0]["divisions"][1]["teams"]
        east = json["conferences"][0]["divisions"][2]["teams"]
        west = json["conferences"][0]["divisions"][3]["teams"]

        north.each {|team| all_teams << team}
        cent.each {|team| all_teams << team}
        east.each {|team| all_teams << team}
        west.each {|team| all_teams << team}
        # binding.pry
        AstanleyCLIProject::Team.new_team_hash(all_teams)
    end
end